import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/renter/data/bill_repository.dart';
import 'package:heistom/renter/presentation/widgets/booked_housecard_tile.dart';
import 'package:get/get.dart';
import 'dart:io';

class BookedHomestayPage extends StatefulWidget {
  const BookedHomestayPage({super.key});

  @override
  State<BookedHomestayPage> createState() => _BookedHomestayPageState();
}

class _BookedHomestayPageState extends State<BookedHomestayPage> {
  final GlobalController globalController = Get.find<GlobalController>();
  final BillRepository billRepository = Get.find<BillRepository>();

  List<BillEntity>? bills;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBills();
  }

  Future<void> loadBills() async {
    try {
      final fetchedBills = await billRepository.getBills();
      setState(() {
        bills = fetchedBills;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        bills = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  globalController.user.name ?? '',
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
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Danh sách phòng đặt',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1A1A)),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: (bills == null || bills!.isEmpty)
                        ? Center(
                            child: Column(
                              children: const [
                                SizedBox(height: 48),
                                Icon(Icons.info_outline,
                                    size: 48, color: Colors.grey),
                                SizedBox(height: 12),
                                Text(
                                  'Bạn chưa đặt phòng nào',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: bills!
                                .map((bill) => Column(
                                      children: [
                                        BookedHousecardTile(bill: bill),
                                        const SizedBox(height: 12),
                                      ],
                                    ))
                                .toList(),
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}
