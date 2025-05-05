// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => _RoomModel(
      id: json['id'] as String?,
      status: json['status'] as String?,
      checkInDate: json['checkInDate'] as num?,
      checkOutDate: json['checkOutDate'] as num?,
      capacity: (json['capacity'] as num?)?.toInt(),
      owner: json['owner'] == null
          ? null
          : UserModel.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoomModelToJson(_RoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'capacity': instance.capacity,
      'owner': instance.owner,
    };
