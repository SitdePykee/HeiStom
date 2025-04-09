import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heistom/common/data/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lodging_model.freezed.dart';
part 'lodging_model.g.dart';

@freezed
sealed class LodgingModel with _$LodgingModel {
  factory LodgingModel({
    String? id,
    String? name,
    String? address,
    double? pricePerDay,
    double? pricePerMonth,
    double? area,
    List<String>? image,
    String? description,
    int? views,
    List<String>? amenities,
    UserModel? owner,
    num? uploadDate,
    num? lat,
    num? lng,
  }) = _LodgingModel;

  factory LodgingModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingModelFromJson(json);
}
