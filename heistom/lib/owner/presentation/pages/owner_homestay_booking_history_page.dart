import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';

import '../../../common/global_controller.dart';
import '../../../common/widgets/app_bar.dart';

class OwnerHomestayBookingHistoryPage extends StatefulWidget {
  const OwnerHomestayBookingHistoryPage({super.key, required this.lodging});

  final LodgingEntity lodging;

  @override
  State<OwnerHomestayBookingHistoryPage> createState() =>
      _OwnerHomestayBookingHistoryPageState();
}

class _OwnerHomestayBookingHistoryPageState
    extends State<OwnerHomestayBookingHistoryPage> {
  DateTime selectedDate = DateTime(2025, 4, 20);

  final globalController = Get.find<GlobalController>();

  final List<Map<String, String>> bookings = [
    {'room': '03', 'date': '20/4 - 21/4', 'customer': 'Chị Bùi Thị Dạ Hương'},
    {'room': '05', 'date': '19/4 - 20/4', 'customer': 'Lê Vũ Tấn Minh'},
    {'room': '07 & 08', 'date': '20/4 - 23/4', 'customer': 'Vũ Hoàng An'},
    {'room': '10', 'date': '19/4 - 21/4', 'customer': 'Phạm Trung Hiếu'},
    {'room': '14', 'date': '20/4 - 22/4', 'customer': 'Nguyễn Đức Huy'},
    {'room': '15', 'date': '20/4 - 21/4', 'customer': 'Nguyễn Quang Minh'},
  ];

  void _changeMonth(int offset) {
    setState(() {
      selectedDate =
          DateTime(selectedDate.year, selectedDate.month + offset, 1);
    });
  }

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
            _buildCalendar(),
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

  Widget _buildCalendar() {
    final days = [
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15],
    ];
    final selectedDay = selectedDate.day;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => _changeMonth(-1),
              ),
              Text(
                '${selectedDate.day.toString().padLeft(2, '0')}/'
                '${selectedDate.month.toString().padLeft(2, '0')}/'
                '${selectedDate.year}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () => _changeMonth(1),
              ),
            ],
          ),
          const Divider(),
          Column(
            children: days.map((week) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: week.map((day) {
                  final isSelected = day == selectedDay;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = DateTime(
                            selectedDate.year, selectedDate.month, day);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF539CB7)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$day',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ],
      ),
    );
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
        Expanded(
          child: ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(booking['date'] ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        booking['customer'] ?? '',
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
