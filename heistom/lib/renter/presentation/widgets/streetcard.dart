import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/street_entity.dart';
import '../../../common/domain/entity/lodging_entity.dart';
import '../../../lodging/presentation/pages/detail_lodging_page.dart';

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
                child: Image.asset(
                  street.image ?? '',
                  fit: BoxFit.cover,
                  width: 74,
                  height: 74,
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
