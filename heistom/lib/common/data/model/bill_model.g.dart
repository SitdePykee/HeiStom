// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillModel _$BillModelFromJson(Map<String, dynamic> json) => _BillModel(
      id: json['id'] as String?,
      lodging: json['lodging'] == null
          ? null
          : LodgingModel.fromJson(json['lodging'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      numberOfPeople: (json['numberOfPeople'] as num?)?.toInt(),
      room: (json['room'] as List<dynamic>?)
          ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkInDate: json['checkInDate'] as num?,
      checkOutDate: json['checkOutDate'] as num?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      paymentMethod: json['paymentMethod'] as String?,
    );

Map<String, dynamic> _$BillModelToJson(_BillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lodging': instance.lodging,
      'user': instance.user,
      'numberOfPeople': instance.numberOfPeople,
      'room': instance.room,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'totalPrice': instance.totalPrice,
      'paymentMethod': instance.paymentMethod,
    };
