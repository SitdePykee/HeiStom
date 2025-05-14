import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controllers/owner_statistics_c.dart';

class OwnerStatisticsPage extends StatefulWidget {
  const OwnerStatisticsPage({super.key});

  @override
  State<OwnerStatisticsPage> createState() => _OwnerStatisticsPageState();
}

class _OwnerStatisticsPageState extends State<OwnerStatisticsPage> {
  final controller = Get.put(OwnerStatisticsController());

  final NumberFormat _currencyFormat =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ');

  @override
  void initState() {
    super.initState();
  }

  Widget _buildDropdown({
    required String hintText,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(hintText, style: TextStyle(color: Colors.grey.shade700)),
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildStatsRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? Colors.black)),
        ],
      ),
    );
  }

  Widget _buildTotalStatsView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DOANH SỐ TỔNG CỦA CHỦ NHÀ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildStatsRow('Số lượt đặt phòng',
              controller.totalStats.value?.bookings.toString() ?? '0'),
          _buildStatsRow(
              'Doanh số',
              _currencyFormat
                  .format(controller.totalStats.value?.revenue ?? 0)),
        ],
      ),
    );
  }

  Widget _buildDateNavigator(
      DateTime currentDate, ValueChanged<DateTime> onDateChanged,
      {bool isWeekly = false}) {
    String formattedDate;
    if (isWeekly) {
      final endDate = currentDate.add(const Duration(days: 6));
      formattedDate =
          '${DateFormat('dd/MM/yyyy').format(currentDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)}';
    } else {
      formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, size: 30, color: Colors.blue),
          onPressed: () {
            onDateChanged(
                currentDate.subtract(Duration(days: isWeekly ? 7 : 1)));
            if (isWeekly) {
              controller.selectedWeekStartDate.value =
                  currentDate.subtract(Duration(days: 7));
              controller.getStats(
                  type: 'WEEK',
                  startDate: DateTime.now().millisecondsSinceEpoch);
            } else {
              controller.selectedDate.value =
                  currentDate.subtract(Duration(days: 1));
              controller.getStats(
                  type: 'DAY',
                  startDate: DateTime.now().millisecondsSinceEpoch);
            }
          },
        ),
        Text(
          formattedDate,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, size: 30, color: Colors.blue),
          onPressed: () {
            onDateChanged(currentDate.add(Duration(days: isWeekly ? 7 : 1)));
            if (isWeekly) {
              controller.selectedWeekStartDate.value =
                  currentDate.add(Duration(days: 7));
              controller.getStats(
                  type: 'WEEK',
                  startDate: DateTime.now().millisecondsSinceEpoch);
            } else {
              controller.selectedDate.value =
                  currentDate.add(Duration(days: 1));
              controller.getStats(
                  type: 'DAY',
                  startDate: DateTime.now().millisecondsSinceEpoch);
            }
          },
        ),
      ],
    );
  }

  Widget _buildDailyStatsView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateNavigator(controller.selectedDate.value, (newDate) {
            controller.selectedDate.value = newDate;
          }),
          const SizedBox(height: 16),
          Text(
            controller.selectedLocation.value?.name ?? '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildStatsRow('Số lượt đặt phòng',
              controller.dailyStats.value?.bookings.toString() ?? '0'),
          _buildStatsRow(
              'Doanh số',
              _currencyFormat
                  .format(controller.dailyStats.value?.revenue ?? 0)),
        ],
      ),
    );
  }

  Widget _buildWeeklyStatsView() {
    Widget actualChart = LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = width * 0.5; // 2:1 aspect ratio
        return SizedBox(
          width: width,
          height: height,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: controller.weeklyStats.value?.revenue.isNotEmpty ?? false
                  ? (controller.weeklyStats.value!.revenue.values.reduce(
                              (a, b) => a > b ? a / 1000000.0 : b / 1000000.0) +
                          1.0)
                      .ceilToDouble() // Ensure double
                  : 5.0, // Ensure double and provide a default if empty
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const style = TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                      String text;
                      switch (value.toInt()) {
                        case 0:
                          text = 'Mon';
                          break;
                        case 1:
                          text = 'Tue';
                          break;
                        case 2:
                          text = 'Wed';
                          break;
                        case 3:
                          text = 'Thu';
                          break;
                        case 4:
                          text = 'Fri';
                          break;
                        case 5:
                          text = 'Sat';
                          break;
                        case 6:
                          text = 'Sun';
                          break;
                        default:
                          text = '';
                          break;
                      }
                      return SideTitleWidget(
                          space: 4.0,
                          meta: TitleMeta(
                              min: 0,
                              max: 10,
                              parentAxisSize: 10,
                              axisPosition: 10,
                              appliedInterval: 10,
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 28,
                                  interval: 1,
                                  getTitlesWidget: (value, meta) {
                                    return Text(value.toInt().toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                        textAlign: TextAlign.left);
                                  }),
                              rotationQuarterTurns: 10,
                              formattedValue: '',
                              axisSide: AxisSide.bottom),
                          child: Text(text, style: style));
                    },
                    reservedSize: 30,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: 10,
                      getTitlesWidget: (value, meta) {
                        if (value == 0 || value == meta.max) return Container();
                        if (value % 1 != 0 && value != meta.max)
                          return Container(); // Show only integer values, allow max if not int
                        return Text(value.toInt().toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                            textAlign: TextAlign.left);
                      }),
                ),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                      color: Colors.grey.shade300,
                      strokeWidth: 1,
                      dashArray: [3, 3]);
                },
                horizontalInterval: 1,
              ),
              barGroups: controller.weeklyStats.value!.revenue.entries
                  .mapIndexed((index, entry) {
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value / 1000000.0,
                      color: Colors.blue,
                      width: 8,
                      borderRadius: BorderRadius.circular(4),
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateNavigator(controller.selectedWeekStartDate.value,
              (newDate) {
            controller.selectedWeekStartDate.value = newDate;
            controller.getStats(
                type: 'WEEK',
                startDate: controller
                    .selectedWeekStartDate.value.millisecondsSinceEpoch);
          }, isWeekly: true),
          const SizedBox(height: 16),
          Text(
            controller.selectedLocation.value?.name ?? '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildStatsRow('Số lượt đặt phòng',
              controller.weeklyStats.value?.bookings.toString() ?? '0'),
          _buildStatsRow(
              'Doanh số',
              _currencyFormat.format(controller
                      .weeklyStats.value?.revenue.values
                      .reduce((a, b) => a + b) ??
                  0)),
          const SizedBox(height: 24),
          actualChart, // Use the actual chart widget
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (controller.selectedTimeFilter.value == 'Theo ngày') {
      return _buildDailyStatsView();
    } else if (controller.selectedTimeFilter.value == 'Theo tuần') {
      return _buildWeeklyStatsView();
    }
    return _buildTotalStatsView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light grey background as in image
      appBar: AppBar(
        title: const Text('THỐNG KÊ DOANH SỐ',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    _buildDropdown(
                      hintText: 'Chọn địa điểm',
                      value:
                          '${controller.selectedLocation.value?.name ?? ''} - ${controller.selectedLocation.value?.address ?? ''}',
                      items: controller.locations
                          .map((e) => '${e.name ?? ''} - ${e.address ?? ''}')
                          .toSet()
                          .toList(),
                      onChanged: (newValue) {
                        controller.selectedLocation.value = controller.locations
                            .firstWhere((e) =>
                                ('${e.name ?? ''} - ${e.address ?? ''}') ==
                                newValue);
                        controller.getStats(
                            type: 'TOTAL',
                            startDate: DateTime.now().millisecondsSinceEpoch);
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildDropdown(
                      hintText: 'Chọn thời gian',
                      value: controller.selectedTimeFilter.value,
                      items: controller.timeFilters.toSet().toList(),
                      onChanged: (newValue) {
                        controller.selectedTimeFilter.value = newValue ?? '';
                        if (newValue == 'Theo ngày') {
                          controller.selectedDate.value = DateTime(2025, 4, 20);
                          controller.getStats(
                              type: 'DAY',
                              startDate: DateTime.now().millisecondsSinceEpoch);
                        } else if (newValue == 'Theo tuần') {
                          controller.selectedWeekStartDate.value =
                              DateTime(2025, 4, 20);
                          controller.getStats(
                              type: 'WEEK',
                              startDate: DateTime.now().millisecondsSinceEpoch);
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    _buildContent(),
                  ],
                ),
        ),
      ),
    );
  }
}
