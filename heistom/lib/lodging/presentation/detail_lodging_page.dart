import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:heistom/common/amenities.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/extensions/num_extensions.dart';
import 'package:heistom/owner/presentation/detail_owner_page.dart';
import 'package:latlong2/latlong.dart';

class DetailLodgingPage extends StatefulWidget {
  const DetailLodgingPage({super.key, required this.lodging});

  final LodgingEntity lodging;

  @override
  State<DetailLodgingPage> createState() => _DetailLodgingPageState();
}

class _DetailLodgingPageState extends State<DetailLodgingPage> {
  final currentImageIndex = RxInt(0);
  final carouselController = CarouselController();

  @override
  void initState() {
    carouselController.addListener(() {
      final position = carouselController.position;
      final width = MediaQuery.sizeOf(context).width;
      if (position.hasPixels) {
        final index = (position.pixels / width).round();
        currentImageIndex.value = index;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [
          Icon(
            Icons.favorite_border,
            color: Colors.black,
            size: 24,
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: Color(0xff21C3FF), borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              'Đặt phòng',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        )
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            _carouselView,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.lodging.name ?? '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  'VND ${widget.lodging.pricePerDay}/ 1 ngày',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff21C3FF)),
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.lodging.uploadDate?.toDayCountString()} / ${widget.lodging.views ?? 0} lượt xem',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8D959D)),
                ),
                const SizedBox(height: 8),
                Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xff22313F),
                      size: 24,
                    ),
                    Text(
                      '${widget.lodging.address}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff22313F)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (widget.lodging.amenities?.isNotEmpty ?? false)
                  _amenitiesView,
                const SizedBox(height: 16),
                Text(
                  'Mô tả',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Text(
                  '${widget.lodging.description}',
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
                          Image.network(widget.lodging.owner?.avatar ?? '')
                              .image,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.lodging.owner?.name ?? '',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${widget.lodging.owner?.phone}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8D959D)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Get.to(
                          () => DetailOwnerPage(owner: widget.lodging.owner!)),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Color(0xff21C3fF), width: 1),
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
                        initialCenter: LatLng(
                            widget.lodging.lat?.toDouble() ?? 0,
                            widget.lodging.lng?.toDouble() ?? 0),
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
                const SizedBox(height: 28),
                Text(
                  'Có thể bạn quan tâm',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ).paddingAll(16)
          ],
        ),
      ),
    );
  }

  Widget get _carouselView => SizedBox(
        height: 240,
        child: Obx(
          () => Stack(
            children: [
              ClipRect(
                child: CarouselView.weighted(
                  controller: carouselController,
                  flexWeights: [1],
                  shrinkExtent: MediaQuery.sizeOf(context).width,
                  itemSnapping: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  children: widget.lodging.image
                          ?.map((e) => Image.network(
                                e,
                                fit: BoxFit.cover,
                              ))
                          .toList() ??
                      [],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(widget.lodging.image?.length ?? 0, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: currentImageIndex.value == index ? 24 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: currentImageIndex.value == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    );
                  }),
                ),
              ).marginOnly(bottom: 12)
            ],
          ),
        ),
      );

  Widget get _amenitiesView => Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffF7F7F7),
        ),
        child: IntrinsicWidth(
          child: Center(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (widget.lodging.amenities ?? []).map((e) {
                final amentity = Amenities.fromString(e);
                if (amentity == null) return SizedBox.shrink();
                return Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      amentity.icon,
                      color: Color(0xff22313F),
                      size: 24,
                    ),
                    Text(
                      amentity.displayName,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff22313F)),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      );
}
