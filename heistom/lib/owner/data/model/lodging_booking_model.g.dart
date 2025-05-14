// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lodging_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LodgingBookingModel _$LodgingBookingModelFromJson(Map<String, dynamic> json) =>
    _LodgingBookingModel(
      id: json['id'] as String?,
      lodging: json['lodging'] == null
          ? null
          : LodgingModel.fromJson(json['lodging'] as Map<String, dynamic>),
      bookedAt: json['bookedAt'] as num?,
    );

Map<String, dynamic> _$LodgingBookingModelToJson(
        _LodgingBookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lodging': instance.lodging,
      'bookedAt': instance.bookedAt,
    };
