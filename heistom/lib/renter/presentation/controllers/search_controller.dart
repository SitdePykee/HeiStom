import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:heistom/common/amenities.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';

class SearchHouseController extends GetxController {
  var searchQuery = ''.obs;
  final searchController = TextEditingController();
  var checkInDate = DateTime.now().obs;
  var checkOutDate = DateTime.now().add(const Duration(days: 1)).obs;
  var peopleCount = 1.obs;
  var roomCount = 1.obs;
  var results = <LodgingEntity>[].obs;

  var selectedAmenities = <Amenities>[].obs;

  void toggleAmenity(Amenities amenity) {
    selectedAmenities.contains(amenity)
        ? selectedAmenities.remove(amenity)
        : selectedAmenities.add(amenity);
  }

  void clearAmenities() {
    selectedAmenities.clear();
  }
}
