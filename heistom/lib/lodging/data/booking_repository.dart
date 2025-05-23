import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';

class BookingRepository {
  Dio dio = Dio();
  final String baseUrl = 'http://10.0.2.2:8080/v1';
  SearchHouseController searchController = Get.find<SearchHouseController>();

  Future<void> bookLodging(String id) async {
    try {
      final response = await dio.post(
        '$baseUrl/lodging/book',
        data: {
          "lodgingId": id,
          "criteria": {
            "checkIn":
                searchController.checkInDate.value.millisecondsSinceEpoch,
            "checkOut":
                searchController.checkOutDate.value.millisecondsSinceEpoch,
            "numberOfPeople": searchController.peopleCount.value,
            "numberOfRoom": searchController.roomCount.value,
          },
          "amenities": searchController.selectedAmenities
              .map((amenity) => amenity.name)
              .toList(),
        },
      );
      if (response.statusCode == 200) {
      } else {
        // Handle error
      }
    } catch (e) {
      debugPrint('Error booking lodging: $e');
      rethrow;
    }
  }
}
