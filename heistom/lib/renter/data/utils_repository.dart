import 'package:dio/dio.dart';
import 'package:heistom/common/data/model/lodging_model.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/domain/entity/street_entity.dart';
import 'package:heistom/common/global_controller.dart';

class UtilsRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://localhost:8080/v1';


  Future<List<LodgingEntity>> getLodgings() async {
    try {
      final response = await dio.post(
        '$baseUrl/lodging/search',
        data: {
          'address': '',
        },
      );
      if (response.statusCode == 200) {
        List<LodgingEntity> lodgings = (response.data['data'] as List)
            .map((lodging) => LodgingModel.fromJson(lodging).toEntity())
            .toList();
        return lodgings;
      } else {
        throw Exception('Failed to load lodgings');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}