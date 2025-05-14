// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lodging_booking_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LodgingBookingDetailModel _$LodgingBookingDetailModelFromJson(
        Map<String, dynamic> json) =>
    _LodgingBookingDetailModel(
      bookingId: json['bookingId'] as String?,
      lodging: json['lodging'] == null
          ? null
          : LodgingModel.fromJson(json['lodging'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      checkInAt: json['checkInAt'] as num?,
      checkOutAt: json['checkOutAt'] as num?,
      isBankTransfer: json['isBankTransfer'] as bool?,
      numOfRoom: json['numOfRoom'] as num?,
    );

Map<String, dynamic> _$LodgingBookingDetailModelToJson(
        _LodgingBookingDetailModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'lodging': instance.lodging,
      'user': instance.user,
      'checkInAt': instance.checkInAt,
      'checkOutAt': instance.checkOutAt,
      'isBankTransfer': instance.isBankTransfer,
      'numOfRoom': instance.numOfRoom,
    };
