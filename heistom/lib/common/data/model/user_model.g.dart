// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'address': instance.address,
      'type': instance.type,
    };
