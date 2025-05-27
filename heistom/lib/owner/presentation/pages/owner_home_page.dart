import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/owner/presentation/pages/owner_notification_page.dart';
import 'package:heistom/renter/presentation/pages/homepage.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../../lodging/presentation/widgets/lodging_list_item_w.dart';
import '../controllers/owner_home_page_c.dart';
import 'owner_homestay_booking_history_page.dart';

class OwnerHomePage extends StatelessWidget {
  OwnerHomePage({super.key});

  final NumberFormat _currencyFormat =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ');

  final controller = Get.put(OwnerHomePageController());

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find<GlobalController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(globalController.user.avatar ?? ''),
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
            ),
            IconButton(
              onPressed: () {
                Get.to(() => OwnerNotificationPage());
              },
              icon: const Icon(Icons.notifications_outlined),
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Phòng đã đăng',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.getMyLodgings();
                          },
                          child: const Text(
                            'Làm mới',
                            style: TextStyle(
                              color: Color(0xff0090FF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 12),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.myLodgings.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 0),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: LodgingListItem(
                              lodging: controller.myLodgings[index],
                              showFavorite: false,
                              onTap: () {
                                Get.to(() => OwnerHomestayBookingHistoryPage(
                                    lodging: controller.myLodgings[index]));
                              },
                              lastRow: Text(
                                'VND ${_currencyFormat.format(controller.myLodgings[index].dayPrice ?? 0)}/ngày',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff0090FF),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
