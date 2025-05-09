// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
      reviewer: json['reviewer'] == null
          ? null
          : UserModel.fromJson(json['reviewer'] as Map<String, dynamic>),
      lodgingID: json['lodgingID'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      postAt: json['postAt'] as num?,
    );

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'reviewer': instance.reviewer,
      'lodgingID': instance.lodgingID,
      'rating': instance.rating,
      'comment': instance.comment,
      'postAt': instance.postAt,
    };
