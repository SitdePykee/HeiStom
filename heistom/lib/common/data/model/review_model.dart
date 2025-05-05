import 'package:heistom/common/domain/entity/review_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.g.dart';
part 'review_model.freezed.dart';

@freezed
sealed class ReviewModel with _$ReviewModel {
  @JsonSerializable()
  factory ReviewModel({
    String? reviewerID,
    String? lodgingID,
    double? rating,
    String? comment,
    num? postAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

extension ReviewModelX on ReviewModel {
  ReviewEntity toEntity() => ReviewEntity(
        reviewerID: reviewerID,
        lodgingID: lodgingID,
        rating: rating,
        comment: comment,
        postAt: postAt,
      );
}
