import 'dart:core';

class Lodging {
  String? id;
  String? name;
  String? address;
  double? pricePerDay;
  double? pricePerMonth;
  double? acreage;
  String? image;
  String? description;
  int? views;
  List<String>? amenities;
  String? ownerID;

  Lodging({
    this.id,
    this.name,
    this.address,
    this.pricePerDay,
    this.pricePerMonth,
    this.acreage,
    this.image,
    this.description,
    this.views,
    this.amenities,
    this.ownerID,
  });
}
