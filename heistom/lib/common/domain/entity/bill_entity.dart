import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/domain/entity/room_entity.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

class BillEntity {
  String? id;
  String? lodgingID;
  String? user;
  int? numberOfPeople;
  List<RoomEntity>? room;
  num? checkInDate;
  num? checkOutDate;
  String? paymentMethod;

  BillEntity({
    this.id,
    this.lodgingID,
    this.user,
    this.numberOfPeople,
    this.room,
    this.checkInDate,
    this.checkOutDate,
    this.paymentMethod,
  });
}
