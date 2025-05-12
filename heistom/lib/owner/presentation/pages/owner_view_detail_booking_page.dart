import 'package:flutter/material.dart';

import '../../../common/widgets/app_bar.dart';

class OwnerViewDetailBookingPage extends StatelessWidget {
  const OwnerViewDetailBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(),
              const SizedBox(height: 16),
              // Hotel Name
              _buildHotelName(),
              const SizedBox(height: 24),
              // Room Information Section
              _buildSectionTitle('THÔNG TIN PHÒNG'),
              _buildRoomInfoItem('Số phòng', '10'),
              _buildRoomInfoItem('Loại phòng', 'Có điều hoà'),
              _buildRoomInfoItem('Số người ở', '02'),
              _buildRoomInfoItem('Phí', 'VNĐ 1.200.000/Phòng'),
              const SizedBox(height: 24),
              // Customer Information Section
              _buildSectionTitle('THÔNG TIN KHÁCH HÀNG'),
              _buildCustomerInfoItem('Tên', 'Phạm Trung Hiếu'),
              _buildCustomerInfoItem('Email', 'trunghieu@gmail.com'),
              _buildCustomerInfoItem('Số điện thoại', '0123456789'),
              const SizedBox(height: 24),
              // Booking Time Section
              _buildSectionTitle('THỜI GIAN ĐẶT PHÒNG'),
              _buildBookingTimeItem('Check-in', '12:00 Thứ bảy, 19/04/2025'),
              _buildBookingTimeItem('Check-out', '12:00 Thứ hai, 21/04/2025'),
              _buildBookingTimeItem('Số ngày ở', '03'),
              const SizedBox(height: 24),
              // Payment Section
              _buildPaymentSection('THANH TOÁN', 'Chuyển khoản'),
              const SizedBox(height: 32),
              // Back Button
              _buildBackButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHotelName() {
    return const Text(
      'Omina Hanoi Hotel & Travel',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildRoomInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildCustomerInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildBookingTimeItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildPaymentSection(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    Colors.blue)), // Assuming 'Chuyển khoản' is a link/action
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed: () {
          // TODO: Implement back navigation
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        child: const Text('Quay lại', style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 2, // Assuming 'Armchair' icon is the 3rd item (index 2)
      type: BottomNavigationBarType.fixed, // To show labels for all items
      selectedItemColor: Colors.blue, // Or your app's primary color
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '', // No label as per image
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons
              .add_box_outlined), // Using outlined add_box as a placeholder
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chair_outlined), // Armchair icon placeholder
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '',
        ),
      ],
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}

// Helper for text styles (optional, can be integrated directly)
TextStyle _labelStyle() => const TextStyle(color: Colors.grey);
TextStyle _valueStyle() => const TextStyle(fontWeight: FontWeight.bold);
TextStyle _valueStyleRegular() => const TextStyle();
