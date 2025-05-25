import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/renter/data/review_repository.dart';
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
  final ReviewRepository reviewRepository = Get.find<ReviewRepository>();

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
                      int selectedRating = 0;
                      TextEditingController commentController =
                          TextEditingController();

                      Get.dialog(
                        AlertDialog(
                          title: const Text('Đánh giá phòng'),
                          content: StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(5, (index) {
                                      return IconButton(
                                        icon: Icon(
                                          Icons.star,
                                          color: index < selectedRating
                                              ? Colors.amber
                                              : Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            selectedRating = index + 1;
                                          });
                                        },
                                      );
                                    }),
                                  ),
                                  TextField(
                                    controller: commentController,
                                    maxLines: 3,
                                    decoration: const InputDecoration(
                                      hintText: 'Nhập nhận xét của bạn...',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (selectedRating == 0) {
                                  Get.snackbar(
                                    'Lỗi',
                                    'Vui lòng chọn số sao trước khi đánh giá',
                                    backgroundColor:
                                        Colors.red.withOpacity(0.8),
                                    colorText: Colors.white,
                                  );
                                  return;
                                }

                                reviewRepository.createReview(
                                    lodging.id!,
                                    selectedRating.toDouble(),
                                    commentController.text);

                                Get.back();
                                Get.snackbar(
                                  'Thành công',
                                  'Cảm ơn bạn đã đánh giá!',
                                  backgroundColor:
                                      Colors.green.withOpacity(0.7),
                                  colorText: Colors.white,
                                );
                              },
                              child: const Text('Đánh giá'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    child: const Text('Trả phòng',
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
