import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:heistom/owner/data/model/notification_model.dart';

import '../../../common/global_controller.dart';

class NotificationRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://localhost:8080';

  Future<List<NotificationModel>> getNotifications() async {
    final globalController = Get.find<GlobalController>();
    final response =
        await dio.get('$baseUrl/v1/notification', queryParameters: {
      'userId': globalController.user.id,
    });
    return response.data['data']
        .map((e) => NotificationModel.fromJson(e))
        .toList()
        .cast<NotificationModel>();
  }

  Future<void> updateAllNotificationsAsRead() async {
    final globalController = Get.find<GlobalController>();
    await dio.post('$baseUrl/v1/notification', queryParameters: {
      'userId': globalController.user.id,
    });
  }
}
