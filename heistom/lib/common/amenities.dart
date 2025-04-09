import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Amenities {
  free_wifi,
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
      };

  IconData get icon => switch (this) {
        Amenities.free_wifi => Icons.wifi_outlined,
        Amenities.bike_to_airport => Icons.motorcycle_outlined,
      };
}
