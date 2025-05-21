import 'package:heistom/common/domain/entity/user_entity.dart';

class RoomEntity {
  final String? id;
  final num? checkInDate;
  final num? checkOutDate;
  final String? status;
  final UserEntity? owner;
  final int? capacity;
  final String? roomName;

  RoomEntity({
    this.id,
    this.checkInDate,
    this.checkOutDate,
    this.status,
    this.capacity,
    this.owner,
    this.roomName,
  });
}
