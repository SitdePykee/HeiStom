import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lodging_model.freezed.dart';
part 'lodging_model.g.dart';

@freezed
class LodgingModel with _$LodgingModel {
  factory LodgingModel({
    String? id,
    String? name,
    String? address,
    double? pricePerDay,
    double? pricePerMonth,
    double? acreage,
    String? image,
    String? description,
    int? views,
    List<String>? amenities,
    String? ownerID,
  }) = _LodgingModel;

  factory LodgingModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingModelFromJson(json);
}

extension LodgingModelX on LodgingModel {
  LodgingModel get toEntity => LodgingModel(
        id: id,
        name: name,
        address: address,
        pricePerDay: pricePerDay,
        pricePerMonth: pricePerMonth,
        acreage: acreage,
        image: image,
        description: description,
        views: views,
        amenities: amenities,
        ownerID: ownerID,
      );
}
