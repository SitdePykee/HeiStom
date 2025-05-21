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
    String? lodgingId,
    String? userID,
    int? numberOfPeople,
    List<RoomModel>? rooms,
    num? checkInAt,
    num? checkOutAt,
    bool? isBankTransfer,
  }) = _BillModel;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);
}

extension BillModelX on BillModel {
  BillEntity toEntity() => BillEntity(
        id: id,
        lodgingID: lodgingId,
        user: userID,
        numberOfPeople: numberOfPeople,
        room: rooms?.map((room) => room.toEntity()).toList(),
        checkInDate: checkInAt,
        checkOutDate: checkOutAt,
        paymentMethod: isBankTransfer == true ? 'Chuyển khoản' : 'Tiền mặt',
      );
}
