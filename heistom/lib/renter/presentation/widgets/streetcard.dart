import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/street_entity.dart';
import '../../../common/domain/entity/lodging_entity.dart';
import '../../../lodging/presentation/detail_lodging_page.dart';

class Streetcard extends StatelessWidget {
  Streetcard({super.key, required this.street});

  final StreetEntity street;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  street.image ?? '',
                  fit: BoxFit.cover,
                  width: 74,
                  height: 74,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: 74,
                child: Text(
                  street.name ?? 'No name',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
