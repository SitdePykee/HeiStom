import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/notification_model.dart';
import '../../data/repository/notification_repository.dart';

class OwnerNotificationController extends GetxController {
  final notificationRepository = NotificationRepository();

  final isLoading = RxBool(true);
  final notifications = RxList<NotificationModel>();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getNotifications();
      updateAllNotificationsAsRead();
    });
  }

  Future<void> getNotifications() async {
    isLoading.value = true;
    notifications.value = await notificationRepository.getNotifications();
    isLoading.value = false;
  }

  Future<void> updateAllNotificationsAsRead() async {
    await notificationRepository.updateAllNotificationsAsRead();
  }
}
