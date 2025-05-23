import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../global_controller.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key});

  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: globalController.user.avatar != null &&
                      globalController.user.avatar!.isNotEmpty
                  ? FileImage(File(globalController.user.avatar!))
                      as ImageProvider
                  : const AssetImage('assets/images/default_avatar.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Chào buổi sáng',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            Text(
              globalController.user.name!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
