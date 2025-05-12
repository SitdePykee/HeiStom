import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/main.dart';
import 'package:heistom/renter/presentation/pages/bill_page.dart';
import 'package:get/get.dart';

class BillDonePage extends StatelessWidget {
  BillDonePage({super.key, required this.bill});
  final BillEntity bill;

  @override
  Widget build(BuildContext context) {
    bool isHourlyRented = bill.checkOutDate! - bill.checkInDate! < 86400000;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline_outlined,
                  size: 30, color: Colors.green),
              const SizedBox(height: 10),
              Text(
                'BẠN ĐÃ ĐẶT PHÒNG THÀNH CÔNG',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                      offset: Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: InfoSection(
                    bill: bill,
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
                      bill.user?.name ?? '',
                      bill.user?.email ?? '',
                      bill.user?.phone ?? '',
                      bill.room?.map((e) => e.id).join(', ') ?? '',
                      bill.numberOfPeople.toString(),
                      bill.totalPrice.toString(),
                      DateTime.fromMillisecondsSinceEpoch(
                              bill.checkInDate!.toInt())
                          .toString(),
                      DateTime.fromMillisecondsSinceEpoch(
                              bill.checkOutDate!.toInt())
                          .toString(),
                      isHourlyRented
                          ? '${(bill.checkOutDate! - bill.checkInDate!) / 3600000} giờ'
                          : '${(bill.checkOutDate! - bill.checkInDate!) / 86400000} ngày',
                      bill.paymentMethod ?? '',
                    ]),
              ),
              const SizedBox(height: 47),
              TextButton(
                onPressed: () {
                  Get.off(NavBarScreen());
                },
                child: Text(
                  'Xong',
                  style: TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
