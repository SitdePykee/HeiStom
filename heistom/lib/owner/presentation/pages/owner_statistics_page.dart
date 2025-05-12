import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:fl_chart/fl_chart.dart'; // Uncomment if you have fl_chart

// Mock data models (replace with your actual data models)
class TotalStats {
  final int bookings;
  final String timePeriod;
  final double revenue;
  final String location;

  TotalStats({
    required this.bookings,
    required this.timePeriod,
    required this.revenue,
    required this.location,
  });
}

class DailyStats {
  final String locationName;
  final int bookings;
  final int roomsBooked;
  final double revenue;
  final double previousDayComparisonPercentage;

  DailyStats({
    required this.locationName,
    required this.bookings,
    required this.roomsBooked,
    required this.revenue,
    required this.previousDayComparisonPercentage,
  });
}

class WeeklyStats {
  final String locationName;
  final int bookings;
  final int roomsBooked;
  final double revenue;
  final double previousWeekComparisonPercentage;
  final List<double> dailyBookingCounts; // For the chart (Mon to Sun)

  WeeklyStats({
    required this.locationName,
    required this.bookings,
    required this.roomsBooked,
    required this.revenue,
    required this.previousWeekComparisonPercentage,
    required this.dailyBookingCounts,
  });
}

class OwnerStatisticsPage extends StatefulWidget {
  const OwnerStatisticsPage({super.key});

  @override
  State<OwnerStatisticsPage> createState() => _OwnerStatisticsPageState();
}

class _OwnerStatisticsPageState extends State<OwnerStatisticsPage> {
  String? _selectedLocation;
  String? _selectedTimeFilter;

  DateTime _selectedDate = DateTime(2025, 4, 20);
  DateTime _selectedWeekStartDate = DateTime(2025, 4, 20); // Assuming Monday

  final List<String> _locations = [
    'Omina Hanoi Hotel & Travel',
    'Omina Saigon Hotel'
  ];
  final List<String> _timeFilters = ['1 tháng', 'Theo ngày', 'Theo tuần'];

  // Mock data - replace with actual data fetching logic
  TotalStats _totalStats = TotalStats(
    bookings: 25,
    timePeriod: '1 tháng',
    revenue: 300000000,
    location: 'Omina Hanoi Hotel & Travel',
  );

  DailyStats _dailyStats = DailyStats(
    locationName: 'OMINA HANOI HOTEL & TRAVEL',
    bookings: 3,
    roomsBooked: 4,
    revenue: 36000000,
    previousDayComparisonPercentage: 30,
  );

  WeeklyStats _weeklyStats = WeeklyStats(
    locationName: 'OMINA HANOI HOTEL & TRAVEL',
    bookings: 10,
    roomsBooked: 14,
    revenue: 120000000,
    previousWeekComparisonPercentage: 15,
    dailyBookingCounts: [
      1,
      2,
      1,
      0,
      1,
      1,
      4
    ], // Mon, Tue, Wed, Thu, Fri, Sat, Sun
  );

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
          _buildStatsRow('Số lượt đặt phòng', _totalStats.bookings.toString()),
          _buildStatsRow('Thời gian', _totalStats.timePeriod),
          _buildStatsRow(
              'Doanh số', _currencyFormat.format(_totalStats.revenue)),
          _buildStatsRow('Địa điểm đặt khách', _totalStats.location),
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
          _buildDateNavigator(_selectedDate, (newDate) {
            setState(() {
              _selectedDate = newDate;
            });
          }),
          const SizedBox(height: 16),
          Text(
            _dailyStats.locationName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildStatsRow('Số lượt đặt phòng', _dailyStats.bookings.toString()),
          _buildStatsRow('Số phòng đặt', _dailyStats.roomsBooked.toString()),
          _buildStatsRow(
              'Doanh số', _currencyFormat.format(_dailyStats.revenue)),
          _buildStatsRow(
            'So với ngày trước',
            '+${_dailyStats.previousDayComparisonPercentage.toStringAsFixed(0)}%',
            valueColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyStatsView() {
    Widget actualChart = SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _weeklyStats.dailyBookingCounts.isNotEmpty
              ? _weeklyStats.dailyBookingCounts
                      .reduce((a, b) => a > b ? a : b) +
                  1.0 // Ensure double
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
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    if (value == 0 || value == meta.max) return Container();
                    if (value % 1 != 0 && value != meta.max)
                      return Container(); // Show only integer values, allow max if not int
                    return Text(value.toInt().toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.left);
                  }),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
          barGroups:
              _weeklyStats.dailyBookingCounts.asMap().entries.map((entry) {
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value,
                  color: Colors.blue,
                  width: 16,
                  borderRadius: BorderRadius.circular(4),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateNavigator(_selectedWeekStartDate, (newDate) {
            setState(() {
              _selectedWeekStartDate = newDate;
              // Fetch new weekly stats
            });
          }, isWeekly: true),
          const SizedBox(height: 16),
          Text(
            _weeklyStats.locationName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildStatsRow('Số lượt đặt phòng', _weeklyStats.bookings.toString()),
          _buildStatsRow('Số phòng đặt', _weeklyStats.roomsBooked.toString()),
          _buildStatsRow(
              'Doanh số', _currencyFormat.format(_weeklyStats.revenue)),
          _buildStatsRow(
            'So với tuần trước', // Corrected label
            '+${_weeklyStats.previousWeekComparisonPercentage.toStringAsFixed(0)}%',
            valueColor: Colors.green,
          ),
          const SizedBox(height: 24),
          actualChart, // Use the actual chart widget
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedTimeFilter == 'Theo ngày') {
      return _buildDailyStatsView();
    } else if (_selectedTimeFilter == 'Theo tuần') {
      return _buildWeeklyStatsView();
    }
    // Default to total stats or if '1 tháng' is selected (assuming '1 tháng' means total for simplicity here)
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
        child: Column(
          children: [
            _buildDropdown(
              hintText: 'Chọn địa điểm',
              value: _selectedLocation,
              items: _locations,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                  // Fetch data based on new location and current time filter
                });
              },
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              hintText: 'Chọn thời gian',
              value: _selectedTimeFilter,
              items: _timeFilters,
              onChanged: (newValue) {
                setState(() {
                  _selectedTimeFilter = newValue;
                  // Reset dates or fetch data based on new time filter
                  if (newValue == 'Theo ngày') {
                    _selectedDate = DateTime(2025, 4, 20);
                  } else if (newValue == 'Theo tuần') {
                    _selectedWeekStartDate = DateTime(2025, 4, 20);
                  }
                });
              },
            ),
            const SizedBox(height: 24),
            _buildContent(),
          ],
        ),
      ),
    );
  }
}
