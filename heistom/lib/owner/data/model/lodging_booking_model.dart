import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/model/lodging_model.dart';
import '../../../common/data/model/user_model.dart';

part 'lodging_booking_model.freezed.dart';
part 'lodging_booking_model.g.dart';

@freezed
sealed class LodgingBookingModel with _$LodgingBookingModel {
  factory LodgingBookingModel(
      {String? id,
      LodgingModel? lodging,
      num? bookedAt}) = _LodgingBookingModel;

  factory LodgingBookingModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingBookingModelFromJson(json);
}
