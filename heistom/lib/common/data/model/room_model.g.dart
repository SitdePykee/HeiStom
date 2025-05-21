// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => _RoomModel(
      id: json['id'] as String?,
      status: json['status'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      owner: json['owner'] == null
          ? null
          : UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      roomName: (json['roomName'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RoomModelToJson(_RoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'capacity': instance.capacity,
      'owner': instance.owner,
      'roomName': instance.roomName,
    };
