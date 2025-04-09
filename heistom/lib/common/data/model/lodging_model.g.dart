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
      area: (json['area'] as num?)?.toDouble(),
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      views: (json['views'] as num?)?.toInt(),
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      owner: json['owner'] == null
          ? null
          : UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      uploadDate: json['uploadDate'] as num?,
      lat: json['lat'] as num?,
      lng: json['lng'] as num?,
    );

Map<String, dynamic> _$LodgingModelToJson(_LodgingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'pricePerDay': instance.pricePerDay,
      'pricePerMonth': instance.pricePerMonth,
      'area': instance.area,
      'image': instance.image,
      'description': instance.description,
      'views': instance.views,
      'amenities': instance.amenities,
      'owner': instance.owner,
      'uploadDate': instance.uploadDate,
      'lat': instance.lat,
      'lng': instance.lng,
    };
