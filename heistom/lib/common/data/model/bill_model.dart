import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heistom/common/data/model/lodging_model.dart';
import 'package:heistom/common/data/model/room_model.dart';
import 'package:heistom/common/data/model/user_model.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';

part 'bill_model.freezed.dart';
part 'bill_model.g.dart';

@freezed
sealed class BillModel with _$BillModel {
  factory BillModel({
    String? id,
    LodgingModel? lodging,
    UserModel? user,
    int? numberOfPeople,
    List<RoomModel>? room,
    num? checkInDate,
    num? checkOutDate,
    double? totalPrice,
    String? paymentMethod,
  }) = _BillModel;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);
}

extension BillModelX on BillModel {
  BillEntity toEntity() => BillEntity(
        id: id,
        lodging: lodging?.toEntity(),
        user: user?.toEntity(),
        numberOfPeople: numberOfPeople,
        room: room?.map((room) => room.toEntity()).toList(),
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        totalPrice: totalPrice,
        paymentMethod: paymentMethod,
      );
}
