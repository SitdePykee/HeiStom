import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'dart:io';

class LodgingReviewView extends StatelessWidget {
  final LodgingEntity lodging;

  const LodgingReviewView({super.key, required this.lodging});

  @override
  Widget build(BuildContext context) {
    final double rating = lodging.rating ?? 0.0;
    final reviews = lodging.reviews ?? [];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  for (int i = 1; i <= rating.floor(); i++)
                    const Icon(Icons.star, color: Colors.amber, size: 24),
                  if (rating - rating.floor() >= 0.5)
                    const Icon(Icons.star_half, color: Colors.amber, size: 24),
                  for (int i = rating.floor() + (rating - rating.floor() >= 0.5 ? 1 : 0);
                      i < 5;
                      i++)
                    const Icon(Icons.star, color: Colors.grey, size: 24),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: reviews.length,
              separatorBuilder: (context, index) => Divider(
                height: 16,
                thickness: 1,
                color: Colors.grey[300],
              ),
              itemBuilder: (context, index) {
                final review = reviews[index];
                final reviewer = review.reviewer;
                final avatarPath = reviewer?.avatar;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: avatarPath != null ? FileImage(File(avatarPath)) : null,
                      child: avatarPath == null
                          ? const Icon(Icons.person, size: 32)
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                reviewer?.name ?? 'Anonymous',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    review.rating != null
                                        ? review.rating!.toStringAsFixed(1)
                                        : 'N/A',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatTimeAgo(review.postAt),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            review.comment ?? 'Không có bình luận',
                            style: const TextStyle(fontSize: 14),
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
