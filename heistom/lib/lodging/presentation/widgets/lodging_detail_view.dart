import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:heistom/common/amenities.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/lodging/presentation/pages/detail_lodging_page.dart';
import 'package:heistom/owner/presentation/detail_owner_page.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LodgingDetailView extends StatelessWidget {
  const LodgingDetailView({
    super.key,
    required this.lodging,
  });

  final LodgingEntity lodging;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lodging.name ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 24,
                  ),
                  Text(
                    '${lodging.address}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: Colors.blue,
                    size: 24,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'VND ${lodging.dayPrice}/phòng/ngày',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffEBA731)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: Colors.blue,
                    size: 24,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'VND ${lodging.hourPrice}/giờ/ngày',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffEBA731)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (lodging.amenities?.isNotEmpty ?? false) ...[
                Text(
                  'Tiện nghi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: lodging.amenities!.map((amenity) {
                    return Chip(
                      label: Text(
                        Amenities.fromString(amenity)?.displayName ?? '',
                      ),
                      avatar: Icon(
                        Amenities.fromString(amenity)?.icon,
                        size: 20,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    );
                  }).toList(),
                ),
              ],
              const SizedBox(height: 16),
              Text(
                'Mô tả',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              Text(
                '${lodging.description}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff22313F)),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        Image.network(lodging.owner?.avatar ?? '').image,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lodging.owner?.name ?? '',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${lodging.owner?.phone}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8D959D)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () =>
                        Get.to(() => DetailOwnerPage(owner: lodging.owner!)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xff21C3fF), width: 1),
                      ),
                      child: Center(
                        child: Text(
                          'Xem chủ nhà',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff21C3fF)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 28),
              Text(
                'Địa chỉ trên map',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 217,
                child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(lodging.lat?.toDouble() ?? 0,
                          lodging.lng?.toDouble() ?? 0),
                      initialZoom: 13,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                      ),
                    ]),
              ),
            ],
          ).paddingAll(16)
        ],
      ),
    );
  }
}
