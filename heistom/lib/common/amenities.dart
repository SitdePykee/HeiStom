import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Amenities {
  free_wifi,
  gym,
  free_breakfast,
  children_friendly,
  free_parking,
  pet_friendly,
  air_conditioning,
  swimming_pool,
  bar,
  private_dining_room,
  bike_to_airport;

  static Amenities? fromString(String value) {
    return Amenities.values
        .firstWhereOrNull((e) => e.name == value.toLowerCase());
  }
}

extension AmenitiesX on Amenities {
  String get displayName => switch (this) {
        Amenities.free_wifi => 'Miễn phí',
        Amenities.bike_to_airport => 'Xe đưa đón sân bay',
        Amenities.gym => 'Phòng gym',
        Amenities.free_breakfast => 'Bữa sáng miễn phí',
        Amenities.children_friendly => 'Phù hợp trẻ nhỏ',
        Amenities.free_parking => 'Bãi đỗ xe miễn phí',
        Amenities.pet_friendly => 'Không cấm chó/mèo',
        Amenities.air_conditioning => 'Điều hòa',
        Amenities.swimming_pool => 'Bể bơi',
        Amenities.bar => 'Quầy bar',
        Amenities.private_dining_room => 'Phòng ăn riêng',
      };

  IconData get icon => switch (this) {
        Amenities.free_wifi => Icons.wifi_outlined,
        Amenities.bike_to_airport => Icons.motorcycle_outlined,
        Amenities.gym => Icons.fitness_center,
        Amenities.free_breakfast => Icons.free_breakfast_outlined,
        Amenities.children_friendly => Icons.child_care_outlined,
        Amenities.free_parking => Icons.local_parking_outlined,
        Amenities.pet_friendly => Icons.pets_outlined,
        Amenities.air_conditioning => Icons.ac_unit_outlined,
        Amenities.swimming_pool => Icons.pool_outlined,
        Amenities.bar => Icons.local_bar_outlined,
        Amenities.private_dining_room => Icons.dining_outlined,
      };
}
