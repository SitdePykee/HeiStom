import 'package:dio/dio.dart';
import 'package:heistom/common/data/model/bill_model.dart';
import 'package:heistom/common/data/model/lodging_model.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/presentation/controllers/bill_controller.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';

class BillRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://localhost:8080/v1';
  GlobalController globalController = Get.find<GlobalController>();
  BillController billController = Get.find<BillController>();
  final SearchHouseController searchController = Get.find<SearchHouseController>();

  Future<List<BillEntity>> getBills() async {
    try {
      final response = await dio.get(
        '$baseUrl/lodging/user-book-list',
        queryParameters: 
          {'userId': '${globalController.user.id}'},
      );
      if (response.statusCode == 200) {
        List<BillEntity> bills = (response.data['data'] as List)
            .map((bill) => BillModel.fromJson(bill).toEntity())
            .toList();
        return bills;
      } else {
        throw Exception('Failed to load bills');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<BillEntity> createBill(String lodgingId) async {
    try {
      final response = await dio.post(
        '$baseUrl/lodging/book',
        data: {
          'lodgingId': lodgingId,
          'userId': globalController.user.id,
          'criteria': {
            'address' : searchController.searchController.text,
            'checkIn': searchController.checkInDate.value.millisecondsSinceEpoch,
            'checkOut': searchController.checkOutDate.value.millisecondsSinceEpoch,
            'numOfPeople': searchController.peopleCount.value,
            'numOfRoom': searchController.roomCount.value,
          },
          'amenities': searchController.selectedAmenities.map((amenity) => amenity.name).toList(),
          'bankTransfer': billController.isTransfer().value,
        },
      );
      if (response.statusCode == 200) {
        BillEntity bill = BillModel.fromJson(response.data['data']).toEntity();
        return bill;
      } else {
        throw Exception('Failed to create bill');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<LodgingEntity> getLodgingById(String id) async {
    try {
      String url = '$baseUrl/lodging/$id';
      final response = await dio.get(
        '$baseUrl/lodging/$id',
      );
      if (response.statusCode == 200) {
        return LodgingModel.fromJson(response.data['data']).toEntity();
      } else {
        throw Exception('Failed to load lodging');
      }
    } catch (e) {
      rethrow;
    }
  }
}