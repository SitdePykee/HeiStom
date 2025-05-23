import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heistom/common/data/model/user_model.dart';
import 'package:heistom/common/domain/entity/room_entity.dart';

part 'room_model.g.dart';
part 'room_model.freezed.dart';

@freezed
sealed class RoomModel with _$RoomModel {
  @JsonSerializable()
  factory RoomModel({
    String? id,
    String? status,
    int? capacity,
    UserModel? owner,
    int? roomName,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);
}

extension RoomModelX on RoomModel {
  RoomEntity toEntity() => RoomEntity(
        id: id,
        status: status,
        capacity: capacity,
        roomName: roomName.toString(),
        owner: owner?.toEntity(),
      );
}
