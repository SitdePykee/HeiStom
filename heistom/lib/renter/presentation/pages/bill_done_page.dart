import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/main.dart';
import 'package:heistom/renter/data/bill_repository.dart';
import 'package:heistom/renter/presentation/pages/bill_page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillDonePage extends StatefulWidget {
  BillDonePage({super.key, required this.bill});
  final BillEntity bill;



  @override
  State<BillDonePage> createState() => _BillDonePageState();
}

class _BillDonePageState extends State<BillDonePage> {


  GlobalController globalController = Get.find<GlobalController>();
  BillRepository billRepository = Get.find<BillRepository>();
  LodgingEntity? lodging;
  

  void getLodging() async {
    lodging = await billRepository.getLodgingById(widget.bill.lodgingID!);}

  @override
  initState() {
    getLodging();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  lodging: lodging ?? lodgingPlaceholder, // fallback placeholder
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
                    widget.bill?.toString() ?? '-',
                    checkIn > 0
                      ? DateFormat("yyyy-MM-dd HH:mm").format(
                          DateTime.fromMillisecondsSinceEpoch(checkIn.toInt()))
                      : '-',

                    checkOut > 0
                      ? DateFormat("yyyy-MM-dd HH:mm").format(
                          DateTime.fromMillisecondsSinceEpoch(checkOut.toInt()))
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
