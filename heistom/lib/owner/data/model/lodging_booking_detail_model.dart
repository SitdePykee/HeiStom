import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/model/lodging_model.dart';
import '../../../common/data/model/user_model.dart';

part 'lodging_booking_detail_model.freezed.dart';
part 'lodging_booking_detail_model.g.dart';

@freezed
sealed class LodgingBookingDetailModel with _$LodgingBookingDetailModel {
  const factory LodgingBookingDetailModel(
      {String? bookingId,
      LodgingModel? lodging,
      UserModel? user,
      num? checkInAt,
      num? checkOutAt,
      bool? isBankTransfer,
      num? numOfRoom}) = _LodgingBookingDetailModel;

  factory LodgingBookingDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingBookingDetailModelFromJson(json);
}
