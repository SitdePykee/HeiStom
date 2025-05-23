import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/data/bill_repository.dart';
import 'package:heistom/renter/presentation/controllers/bill_controller.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';
import 'package:heistom/renter/presentation/pages/bill_done_page.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class BillPage extends StatefulWidget {
  BillPage({super.key, required this.lodging});

  LodgingEntity lodging;

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final GlobalController globalController = Get.find<GlobalController>();
  final SearchHouseController searchController =
      Get.find<SearchHouseController>();
  final BillRepository billRepository = Get.find<BillRepository>();
  final BillController billController = Get.find<BillController>();

  String formatDate(num milliseconds) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(milliseconds.toInt());
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Thanh toán')),
          content: Text(
            'Số tiền: ${billController.calculateTotal(searchController.checkInDate.value.millisecondsSinceEpoch, searchController.checkOutDate.value.millisecondsSinceEpoch, widget.lodging, searchController.roomCount.value, searchController.peopleCount.value)} VNĐ',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                BillEntity bill =
                    await billRepository.createBill(widget.lodging.id!);
                Get.to(() => BillDonePage(bill: bill));
              },
              child: const Text('Chuyển hướng tới ngân hàng'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checkIn =
        searchController.checkInDate.value.millisecondsSinceEpoch ?? 0;
    final checkOut =
        searchController.checkOutDate.value.millisecondsSinceEpoch ?? 0;
    final isHourlyRented = checkOut - checkIn < 86400000;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF7F7F7),
        title: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: FileImage(File(globalController.user.avatar!)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Chào buổi sáng',
                    style: TextStyle(fontSize: 12, color: Colors.black87)),
                Text(globalController.user.name ?? 'Người dùng',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            const SizedBox(height: 23),
            Center(
              child: Text(widget.lodging.name ?? 'Lodging Name',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 23),
            InfoSection(
              lodging: widget.lodging,
              isHourlyRented: isHourlyRented,
              title: 'THÔNG TIN ĐẶT PHÒNG',
              left: ['Số phòng', 'Số người', 'Phí'],
              right: [
                searchController.roomCount.toString(),
                searchController.peopleCount.toString(),
                isHourlyRented
                    ? '${widget.lodging.hourPrice ?? 0}đ/giờ'
                    : '${widget.lodging.dayPrice ?? 0}đ/ngày',
              ],
            ),
            const SizedBox(height: 12),
            InfoSection(
              lodging: widget.lodging,
              isHourlyRented: isHourlyRented,
              title: 'THÔNG TIN KHÁCH HÀNG',
              left: ['Tên', 'Email', 'Số điện thoại'],
              right: [
                globalController.user.name ?? 'User Name',
                globalController.user.email ?? 'User Email',
                globalController.user.phone ?? 'User Phone',
              ],
            ),
            const SizedBox(height: 12),
            InfoSection(
              lodging: widget.lodging,
              isHourlyRented: isHourlyRented,
              title: 'THỜI GIAN ĐẶT PHÒNG',
              left: ['Check-in', 'Check-out', 'Số ngày ở'],
              right: [
                formatDate(checkIn),
                formatDate(checkOut),
                isHourlyRented
                    ? '${((checkOut - checkIn) / 3600000).toStringAsFixed(0)} giờ'
                    : '${((checkOut - checkIn) / 86400000).toStringAsFixed(0)} ngày',
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('THANH TOÁN',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Obx(() => DropdownButton<String>(
                        value: billController.paymentMethod.value,
                        items: const [
                          DropdownMenuItem(
                            child: Text('Chuyển khoản'),
                            value: 'Chuyển khoản',
                          ),
                          DropdownMenuItem(
                            child: Text('Tiền mặt'),
                            value: 'Tiền mặt',
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            billController.paymentMethod.value = value;
                          }
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Color(0xffE4E7EB)),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TỔNG TIỀN',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(
                      'Số tiền: ${billController.calculateTotal(searchController.checkInDate.value.millisecondsSinceEpoch, searchController.checkOutDate.value.millisecondsSinceEpoch, widget.lodging, searchController.roomCount.value, searchController.peopleCount.value)} VNĐ',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffEBA731))),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child:
                      const Text('Hủy', style: TextStyle(color: Colors.black)),
                ),
                TextButton(
                  onPressed: () async {
                    if (billController.paymentMethod.value == 'Chuyển khoản') {
                      showConfirmationDialog(context);
                    } else {
                      BillEntity bill =
                          await billRepository.createBill(widget.lodging.id!);
                      Get.to(() => BillDonePage(bill: bill));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                  child: const Text('Thanh toán',
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      }),
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required this.lodging,
    required this.isHourlyRented,
    required this.left,
    required this.right,
    this.title,
  });

  final LodgingEntity lodging;
  final bool isHourlyRented;
  final List<String> left;
  final List<String> right;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(title ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              )),
        ),
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: left
                    .map((e) => Column(
                          children: [
                            Text(
                              e,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7F868A),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ))
                    .toList(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: right
                    .map((e) => Column(
                          children: [
                            Text(
                              e,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          color: Color(0xffE4E7EB),
          thickness: 1,
        ),
      ],
    );
  }
}
