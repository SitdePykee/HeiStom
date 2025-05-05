class ReviewEntity {
  final String? id;
  final double? rating;
  final String? reviewerID;
  final String? lodgingID;
  final String? comment;
  final num? postAt;

  ReviewEntity({
    this.id,
    this.rating,
    this.reviewerID,
    this.lodgingID,
    this.comment,
    this.postAt,
  });
}
