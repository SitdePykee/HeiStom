import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:heistom/common/global_controller.dart';

class ReviewRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://10.0.2.2:8080/v1';
  final GlobalController globalController = Get.find<GlobalController>();

  Future<void> createReview(
      String lodgingId, double rating, String reviewText) async {
    try {
      final response = await dio.post(
        '$baseUrl/rating',
        queryParameters: {
          'lodgingId': lodgingId,
        },
        data: {
          "rating": rating,
          "comment": reviewText,
          "userId": globalController.user.id,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to create review');
      }
    } catch (e) {
      rethrow;
    }
  }
}
