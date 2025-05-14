import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';

class LodgingListItem extends StatelessWidget {
  final Widget lastRow;
  final bool showFavorite;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;
  final VoidCallback? onTap;

  final LodgingEntity lodging;

  const LodgingListItem({
    Key? key,
    required this.lodging,
    required this.lastRow,
    this.showFavorite = true,
    this.onFavoriteTap,
    this.isFavorite = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        color: Colors.white,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File((lodging.image ?? []).firstOrNull ?? ''),
                      errorBuilder: (_, __, ___) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.black26,
                      ),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (showFavorite)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onFavoriteTap,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                          size: 24,
                          shadows: [
                            Shadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lodging.name ?? '--',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        lodging.address ?? '--',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff8D959D)),
                      ),
                      lastRow,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
