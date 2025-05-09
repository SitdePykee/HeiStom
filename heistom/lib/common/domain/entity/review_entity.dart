import 'package:heistom/common/domain/entity/user_entity.dart';

class ReviewEntity {
  final String? id;
  final double? rating;
  final UserEntity? reviewer;
  final String? lodgingID;
  final String? comment;
  final num? postAt;

  ReviewEntity({
    this.id,
    this.rating,
    this.reviewer,
    this.lodgingID,
    this.comment,
    this.postAt,
  });
}
