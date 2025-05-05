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
      dayPrice: (json['dayPrice'] as num?)?.toDouble(),
      hourPrice: (json['hourPrice'] as num?)?.toDouble(),
      area: (json['area'] as num?)?.toDouble(),
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toInt(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
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
      'dayPrice': instance.dayPrice,
      'hourPrice': instance.hourPrice,
      'area': instance.area,
      'image': instance.image,
      'description': instance.description,
      'amenities': instance.amenities,
      'rooms': instance.rooms,
      'rating': instance.rating,
      'reviews': instance.reviews,
      'owner': instance.owner,
      'uploadDate': instance.uploadDate,
      'lat': instance.lat,
      'lng': instance.lng,
    };
