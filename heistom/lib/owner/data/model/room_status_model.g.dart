// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomStatusModel _$RoomStatusModelFromJson(Map<String, dynamic> json) =>
    _RoomStatusModel(
      room: json['room'] == null
          ? null
          : RoomModel.fromJson(json['room'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      booking: json['booking'] == null
          ? null
          : BookingModel.fromJson(json['booking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoomStatusModelToJson(_RoomStatusModel instance) =>
    <String, dynamic>{
      'room': instance.room,
      'user': instance.user,
      'booking': instance.booking,
    };

_RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => _RoomModel(
      id: json['id'] as String?,
      roomName: json['roomName'] as num?,
      capacity: json['capacity'] as num?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$RoomModelToJson(_RoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomName': instance.roomName,
      'capacity': instance.capacity,
      'status': instance.status,
    };

_BookingModel _$BookingModelFromJson(Map<String, dynamic> json) =>
    _BookingModel(
      bookingId: json['bookingId'] as String?,
      lodgingId: json['lodgingId'] as String?,
      userId: json['userId'] as String?,
      roomId: json['roomId'] as String?,
      checkInAt: json['checkInAt'] as num?,
      checkOutAt: json['checkOutAt'] as num?,
      isBankTransfer: json['isBankTransfer'] as bool?,
      numOfRoom: json['numOfRoom'] as num?,
    );

Map<String, dynamic> _$BookingModelToJson(_BookingModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'lodgingId': instance.lodgingId,
      'userId': instance.userId,
      'roomId': instance.roomId,
      'checkInAt': instance.checkInAt,
      'checkOutAt': instance.checkOutAt,
      'isBankTransfer': instance.isBankTransfer,
      'numOfRoom': instance.numOfRoom,
    };
