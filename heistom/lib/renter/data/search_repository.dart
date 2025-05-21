import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:heistom/common/data/model/lodging_model.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import '../presentation/controllers/search_controller.dart';
import 'package:get/get.dart';
class SearchRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://localhost:8080/v1';
  final SearchHouseController searchHouseController = Get.find<SearchHouseController>();

  Future<List<LodgingEntity>> searchLodgings() async {
    try {
      final response = await dio.post(
        '$baseUrl/lodging/search',
        data: {
          'address': searchHouseController.searchController.text,
          'checkIn': searchHouseController.checkInDate.value.millisecondsSinceEpoch,
          'checkOut': searchHouseController.checkOutDate.value.millisecondsSinceEpoch,
          'numberOfPeople': searchHouseController.peopleCount.value,
          'numberOfRoom': searchHouseController.roomCount.value,
          'amenities': searchHouseController.selectedAmenities.map((amenity) => amenity.name).toList(),
        },
      );
      if (response.statusCode == 200) {
        List<LodgingEntity> lodgings = (response.data['data'] as List)
            .map((lodging) => LodgingModel.fromJson(lodging) 
                .toEntity())
            .toList();
        return lodgings;
      } else {
        throw Exception('Failed to load lodgings');
      }
    } catch (e) {
      rethrow;
    }
  }
}