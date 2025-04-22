import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/presentation/pages/search_page.dart';

class FakeSearchBar extends StatelessWidget {
  const FakeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SearchPage());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff22313F).withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(0xffB7B7B7)),
            const SizedBox(width: 8),
            const Text(
              "Tìm kiếm \"Phố Hàng Gà\", ...",
              style: TextStyle(color: Color(0xffB7B7B7), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
