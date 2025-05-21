import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/data/model/lodging_model.dart';
import 'package:heistom/common/extensions/num_extensions.dart';
import 'package:heistom/lodging/presentation/widgets/lodging_list_item_w.dart';

import '../../../common/domain/entity/lodging_entity.dart';
import '../../../common/widgets/app_bar.dart';
import '../controllers/owner_booking_list_c.dart';
import 'owner_view_detail_booking_page.dart';

class OwnerBookingListPage extends StatelessWidget {
  OwnerBookingListPage({super.key});

  final controller = Get.put(OwnerBookingListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBarWidget(),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Yêu cầu đặt Homestay',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Xem tất cả',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          spacing: 12,
                          children: controller.bookingList
                              .map((e) => LodgingListItem(
                                    onTap: () {
                                      Get.to(() => OwnerViewDetailBookingPage(
                                            bookingId: e.id ?? '',
                                          ));
                                    },
                                    lodging: e.lodging?.toEntity() ??
                                        LodgingEntity(),
                                    showFavorite: false,
                                    lastRow: Text(
                                      'Đặt ngày ${e.bookedAt?.toDateString()}',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildBookingItem(
    BuildContext context, {
    required String imageUrl,
    required String hotelName,
    required String address,
    required String bookingDate,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl, // Replace with actual image URL
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                // Error builder for placeholder image
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: Icon(Icons.hotel, color: Colors.grey[500]),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotelName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bookingDate,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.green, // Color from image
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Mock data structure for demonstration
class BookingInfo {
  final String imageUrl;
  final String hotelName;
  final String address;
  final String bookingDate;

  BookingInfo({
    required this.imageUrl,
    required this.hotelName,
    required this.address,
    required this.bookingDate,
  });
}

// You would typically fetch this data from a service or state management
final List<BookingInfo> mockBookings = [
  BookingInfo(
    imageUrl: 'https://example.com/avani.jpg', // Replace with actual image URLs
    hotelName: 'Avani Central Hanoi Hotel',
    address: '22 Quân Sứ, Hoàn Kiếm, Quận Hoàn Kiếm',
    bookingDate: 'Đặt ngày 18/04/2025',
  ),
  BookingInfo(
    imageUrl: 'https://example.com/astoria.jpg',
    hotelName: 'Astoria Hotel',
    address: 'Ngõ Huyện số 16A, Quận Hoàn Kiếm',
    bookingDate: 'Đặt ngày 20/04/2025',
  ),
  BookingInfo(
    imageUrl: 'https://example.com/urban.jpg',
    hotelName: 'Urban Alley Hotel',
    address: '26 Hoi Vu Street, Quận Hoàn Kiếm',
    bookingDate: 'Đặt ngày 20/04/2025',
  ),
  BookingInfo(
    imageUrl: 'https://example.com/fusion.jpg',
    hotelName: 'Fusion Links Apartments',
    address: '154A Hàng Bông, Quận Hoàn Kiếm',
    bookingDate: 'Đặt ngày 01/05/2025',
  ),
];

// To use the mockBookings list:
// Replace the hardcoded _buildBookingItem calls with a ListView.builder:
/*
ListView.separated(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(), // if inside SingleChildScrollView
  itemCount: mockBookings.length,
  itemBuilder: (context, index) {
    final booking = mockBookings[index];
    return _buildBookingItem(
      context,
      imageUrl: booking.imageUrl,
      hotelName: booking.hotelName,
      address: booking.address,
      bookingDate: booking.bookingDate,
    );
  },
  separatorBuilder: (context, index) => const SizedBox(height: 12),
)
*/
