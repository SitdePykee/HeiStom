import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/domain/entity/room_entity.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

class BillEntity {
  String? id;
  LodgingEntity? lodging;
  UserEntity? user;
  int? numberOfPeople;
  List<RoomEntity>? room;
  num? checkInDate;
  num? checkOutDate;
  double? totalPrice;
  String? paymentMethod;

  BillEntity({
    this.id,
    this.lodging,
    this.user,
    this.numberOfPeople,
    this.room,
    this.checkInDate,
    this.checkOutDate,
    this.totalPrice,
    this.paymentMethod,
  });
}
