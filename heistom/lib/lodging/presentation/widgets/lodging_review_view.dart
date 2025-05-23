import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'dart:io';

class LodgingReviewView extends StatelessWidget {
  final LodgingEntity lodging;

  const LodgingReviewView({super.key, required this.lodging});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${lodging.rating ?? 0.0}',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8),
              Row(
                children: [
                  for (int i = 1; i <= lodging.rating!.floor(); i++)
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 24,
                    ),
                  if (lodging.rating! - lodging.rating!.floor() >= 0.5)
                    Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: 24,
                    ),
                  for (int i = lodging.rating!.floor() +
                          (lodging.rating! - lodging.rating!.floor() >= 0.5
                              ? 1
                              : 0);
                      i < 5;
                      i++)
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                      size: 24,
                    ),
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: lodging.reviews?.length ?? 0,
              separatorBuilder: (context, index) => Divider(
                height: 16,
                thickness: 1,
                color: Colors.grey[300],
              ),
              itemBuilder: (context, index) {
                var review = lodging.reviews![index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: review.reviewer?.avatar != null
                          ? FileImage(File(review.reviewer!.avatar!))
                          : null,
                      child: review.reviewer?.avatar == null
                          ? const Icon(Icons.person, size: 32)
                          : null,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                review.reviewer?.name ?? 'Anonymous',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${review.rating?.toStringAsFixed(1) ?? 'N/A'}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            _formatTimeAgo(review.postAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            review.comment ?? 'Không có bình luận',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimeAgo(num? timestamp) {
    if (timestamp == null) return 'Unknown date';
    final postDate = DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    final difference = DateTime.now().difference(postDate);

    if (difference.inMinutes < 1) {
      return 'Vừa xong';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return '$months tháng trước';
    } else {
      int years = (difference.inDays / 365).floor();
      return '$years năm trước';
    }
  }
}
