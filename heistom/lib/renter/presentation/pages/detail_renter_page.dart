import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

class DetailRenterPage extends StatelessWidget {
  DetailRenterPage({super.key, required this.renter});

  final UserEntity renter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          CircleAvatar(
            radius: 32,
            backgroundImage: Image.asset(renter.avatar ?? '').image,
          ),
          const SizedBox(height: 8),
          Text(
            renter.name ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            renter.phone ?? '',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff8D959D)),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Tên'),
                  const SizedBox(height: 8),
                  Text('Email'),
                  const SizedBox(height: 8),
                  Text('Số điện thoại'),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(renter.name ?? ''),
                  const SizedBox(height: 8),
                  Text(renter.email ?? ''),
                  const SizedBox(height: 8),
                  Text(renter.phone ?? ''),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
