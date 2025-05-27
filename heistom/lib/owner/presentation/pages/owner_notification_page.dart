import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/owner_notification_c.dart';

class OwnerNotificationPage extends StatefulWidget {
  const OwnerNotificationPage({super.key});

  @override
  State<OwnerNotificationPage> createState() => _OwnerNotificationPageState();
}

class _OwnerNotificationPageState extends State<OwnerNotificationPage> {
  final controller = Get.put(OwnerNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Thông báo'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        color: controller.notifications[index].hasRead!
                            ? Colors.white
                            : Colors.blue.shade50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            controller.notifications[index].hasRead!
                                ? const SizedBox(width: 8, height: 8)
                                : const Badge(
                                    smallSize: 8, backgroundColor: Colors.blue),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.notifications[index].title!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    controller.notifications[index].content!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 20, vertical: 16),
                      ),
                      if (index < controller.notifications.length - 1)
                        Divider(
                          height: 0.5,
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
