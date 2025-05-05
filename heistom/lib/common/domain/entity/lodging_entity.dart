import 'dart:core';

import 'package:heistom/common/domain/entity/review_entity.dart';
import 'package:heistom/common/domain/entity/room_entity.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

class LodgingEntity {
  String? id;
  String? name;
  String? address;
  double? dayPrice;
  double? hourPrice;
  double? area;
  List<String>? image;
  String? description;
  List<RoomEntity>? rooms;
  int? rating;
  List<ReviewEntity>? reviews;
  List<String>? amenities;
  UserEntity? owner;
  num? uploadDate;
  num? lat;
  num? lng;

  LodgingEntity({
    this.id,
    this.name,
    this.address,
    this.dayPrice,
    this.hourPrice,
    this.area,
    this.image,
    this.description,
    this.amenities,
    this.rooms,
    this.rating,
    this.reviews,
    this.owner,
    this.uploadDate,
    this.lat,
    this.lng,
  });
}
