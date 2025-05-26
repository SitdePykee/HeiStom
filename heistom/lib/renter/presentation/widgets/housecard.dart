import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/domain/entity/lodging_entity.dart';
import '../../../lodging/presentation/pages/detail_lodging_page.dart';

class HouseCard extends StatelessWidget {
  HouseCard({super.key, this.isSearched = true, required this.lodging});
  bool isSearched;

  final LodgingEntity lodging;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(() =>
              DetailLodgingPage(lodging: lodging, isSearched: isSearched));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(lodging.image?.first ?? ''),
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
                  lodging.name ?? 'No name',
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
