// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillModel _$BillModelFromJson(Map<String, dynamic> json) => _BillModel(
      id: json['id'] as String?,
      lodgingId: json['lodgingId'] as String?,
      userID: json['userID'] as String?,
      numberOfPeople: (json['numberOfPeople'] as num?)?.toInt(),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkInAt: json['checkInAt'] as num?,
      checkOutAt: json['checkOutAt'] as num?,
      isBankTransfer: json['isBankTransfer'] as bool?,
    );

Map<String, dynamic> _$BillModelToJson(_BillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lodgingId': instance.lodgingId,
      'userID': instance.userID,
      'numberOfPeople': instance.numberOfPeople,
      'rooms': instance.rooms,
      'checkInAt': instance.checkInAt,
      'checkOutAt': instance.checkOutAt,
      'isBankTransfer': instance.isBankTransfer,
    };
