import 'dart:core';

import 'package:heistom/common/domain/entity/user_entity.dart';

class LodgingEntity {
  String? id;
  String? name;
  String? address;
  double? pricePerDay;
  double? pricePerMonth;
  double? area;
  List<String>? image;
  String? description;
  int? views;
  List<String>? amenities;
  UserEntity? owner;
  num? uploadDate;
  num? lat;
  num? lng;

  LodgingEntity({
    this.id,
    this.name,
    this.address,
    this.pricePerDay,
    this.pricePerMonth,
    this.area,
    this.image,
    this.description,
    this.views,
    this.amenities,
    this.owner,
    this.uploadDate,
    this.lat,
    this.lng,
  });
}
