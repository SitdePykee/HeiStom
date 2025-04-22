import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heistom/common/domain/entity/street_entity.dart';

part 'street_model.g.dart';
part 'street_model.freezed.dart';

@freezed
sealed class StreetModel with _$StreetModel {
  factory StreetModel({
    String? id,
    String? name,
    String? image,
  }) = _StreetModel;

  factory StreetModel.fromJson(Map<String, dynamic> json) =>
      _$StreetModelFromJson(json);
}
