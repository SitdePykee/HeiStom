import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/renter/presentation/controllers/bill_controller.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/presentation/pages/bill_page.dart';
import 'package:intl/intl.dart';

class BillReviewPage extends StatefulWidget {
  BillReviewPage({super.key, required this.bill});
  final BillEntity bill;

  @override
  State<BillReviewPage> createState() => _BillDonePageState();
}

class _BillDonePageState extends State<BillReviewPage> {
  final GlobalController globalController = Get.find<GlobalController>();
  final BillController billController = Get.find<BillController>();
  final SearchHouseController searchController =
      Get.find<SearchHouseController>();

  @override
  Widget build(BuildContext context) {
    final lodging = widget.bill.lodging ?? lodgingPlaceholder;
    final checkIn = widget.bill.checkInDate ?? 0;
    final checkOut = widget.bill.checkOutDate ?? 0;
    final bool isHourlyRented = checkOut - checkIn < 86400000;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline_outlined,
                  size: 30, color: Colors.green),
              const SizedBox(height: 10),
              const Text(
                'BẠN ĐÃ ĐẶT PHÒNG THÀNH CÔNG',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.black),
                ),
                child: InfoSection(
                  lodging: lodging,
                  isHourlyRented: isHourlyRented,
                  left: [
                    'Tên',
                    'Email',
                    'Số điện thoại',
                    'Số phòng',
                    'Số người ở',
                    'Phí',
                    'Check-in',
                    'Check-out',
                    'Số ngày ở',
                    'Thanh toán'
                  ],
                  right: [
                    globalController.user.name ?? 'Không rõ',
                    globalController.user.email ?? 'Không rõ',
                    globalController.user.phone ?? 'Không rõ',
                    widget.bill.room?.map((e) => e.roomName).join(', ') ?? '-',
                    widget.bill.numberOfPeople?.toString() ?? '-',
                    billController
                        .calculateTotal(
                            searchController
                                .checkInDate.value.millisecondsSinceEpoch,
                            searchController
                                .checkOutDate.value.millisecondsSinceEpoch,
                            lodging,
                            searchController.roomCount.value,
                            searchController.peopleCount.value)
                        .toString(),
                    checkIn > 0
                        ? DateFormat("yyyy-MM-dd HH:mm").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                checkIn.toInt()))
                        : '-',
                    checkOut > 0
                        ? DateFormat("yyyy-MM-dd HH:mm").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                checkOut.toInt()))
                        : '-',
                    (checkOut > 0 && checkIn > 0)
                        ? isHourlyRented
                            ? '${((checkOut - checkIn) / 3600000).toStringAsFixed(1)} giờ'
                            : '${((checkOut - checkIn) / 86400000).toStringAsFixed(1)} ngày'
                        : '-',
                    widget.bill.paymentMethod ?? '-',
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Thông báo',
                        middleText:
                            'Vui lòng chờ quản lý liên hệ để duyệt đơn hủy phòng của bạn',
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                          Get.back(); // Đóng dialog
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('Hủy phòng',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text('Xong',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

LodgingEntity lodgingPlaceholder = LodgingEntity(
  id: 'Lỗi',
  name: 'Lỗi',
  address: 'Lỗi',
  description: 'Lỗi',
  image: [],
  dayPrice: 0,
  hourPrice: 0,
  rating: 0,
  amenities: [],
);
