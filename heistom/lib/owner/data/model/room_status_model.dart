import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heistom/common/data/model/user_model.dart';

part 'room_status_model.freezed.dart';
part 'room_status_model.g.dart';

@freezed
sealed class RoomStatusModel with _$RoomStatusModel {
  factory RoomStatusModel({
    RoomModel? room,
    UserModel? user,
    BookingModel? booking,
  }) = _RoomStatusModel;

  factory RoomStatusModel.fromJson(Map<String, dynamic> json) =>
      _$RoomStatusModelFromJson(json);
}

@freezed
sealed class RoomModel with _$RoomModel {
  @JsonSerializable(explicitToJson: true)
  factory RoomModel({
    String? id,
    num? roomName,
    num? capacity,
    String? status,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);
}

@freezed
sealed class BookingModel with _$BookingModel {
  @JsonSerializable(explicitToJson: true)
  factory BookingModel({
    String? bookingId,
    String? lodgingId,
    String? userId,
    String? roomId,
    num? checkInAt,
    num? checkOutAt,
    bool? isBankTransfer,
    num? numOfRoom,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
