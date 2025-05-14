import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';

import '../../../common/global_controller.dart';
import '../../../common/widgets/app_bar.dart';
import '../controllers/owner_homestay_booking_history_c.dart';

class OwnerHomestayBookingHistoryPage extends StatefulWidget {
  const OwnerHomestayBookingHistoryPage({super.key, required this.lodging});

  final LodgingEntity lodging;

  @override
  State<OwnerHomestayBookingHistoryPage> createState() =>
      _OwnerHomestayBookingHistoryPageState();
}

class _OwnerHomestayBookingHistoryPageState
    extends State<OwnerHomestayBookingHistoryPage> {
  final globalController = Get.find<GlobalController>();

  late final controller = Get.put(OwnerHomestayBookingHistoryController(
      lodgingId: widget.lodging.id ?? ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(),
            const SizedBox(height: 16),
            Text(widget.lodging.name ?? '--',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            const SizedBox(height: 12),
            Expanded(child: _buildBookingList()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: 240,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9C846),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Quay lại',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }

  List<List<String>> chunkNames(
      List<Map<String, dynamic>> data, int chunkSize) {
    List<String> names = data.map((item) => item['name'].toString()).toList();

    List<List<String>> chunks = [];
    for (var i = 0; i < names.length; i += chunkSize) {
      int end = (i + chunkSize < names.length) ? i + chunkSize : names.length;
      chunks.add(names.sublist(i, end));
    }

    return chunks;
  }

  Widget _buildBookingList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Text(
            'LỊCH ĐẶT PHÒNG',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          color: const Color(0xFFF7F7F7),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: const [
              Expanded(
                flex: 2,
                child: Text('Phòng',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600)),
              ),
              Expanded(
                flex: 3,
                child: Text('Thời gian',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600)),
              ),
              Expanded(
                flex: 5,
                child: Text('Khách hàng',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
        Obx(
          () => controller.bookings.isEmpty
              ? Center(
                  child: Text('Chưa có khách đặt homestay này'),
                ).marginOnly(top: 16)
              : Expanded(
                  child: ListView.builder(
                    itemCount: controller.bookings.length,
                    itemBuilder: (context, index) {
                      final booking = controller.bookings[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFFF0F0F0)),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(booking['room'] ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(booking['date'] ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                            ),
                            Expanded(
                              flex: 5,
                              child: Text(
                                booking['customer'] ?? '',
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
