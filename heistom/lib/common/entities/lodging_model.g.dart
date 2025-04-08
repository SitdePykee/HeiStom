// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lodging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LodgingModel _$LodgingModelFromJson(Map<String, dynamic> json) =>
    _LodgingModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      pricePerDay: (json['pricePerDay'] as num?)?.toDouble(),
      pricePerMonth: (json['pricePerMonth'] as num?)?.toDouble(),
      acreage: (json['acreage'] as num?)?.toDouble(),
      image: json['image'] as String?,
      description: json['description'] as String?,
      views: (json['views'] as num?)?.toInt(),
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ownerID: json['ownerID'] as String?,
    );

Map<String, dynamic> _$LodgingModelToJson(_LodgingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'pricePerDay': instance.pricePerDay,
      'pricePerMonth': instance.pricePerMonth,
      'acreage': instance.acreage,
      'image': instance.image,
      'description': instance.description,
      'views': instance.views,
      'amenities': instance.amenities,
      'ownerID': instance.ownerID,
    };
