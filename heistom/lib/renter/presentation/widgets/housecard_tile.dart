import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/lodging/presentation/pages/detail_lodging_page.dart';
import 'package:get/get.dart';

class HousecardTile extends StatelessWidget {
  HousecardTile({
    super.key,
    required this.lodging,
  });

  final LodgingEntity lodging;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => DetailLodgingPage(
            lodging: lodging,
          ),
          transition: Transition.rightToLeft,
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Image.network(
              lodging.image?.first ?? '',
              width: 87,
              height: 87,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lodging.name ?? 'No name',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xffFFB800),
                      size: 16,
                    ),
                    Text(
                      lodging.rating?.toString() ?? '0',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                      '${lodging.reviews?.length.toString() ?? 0} đánh giá',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  lodging.address!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${lodging.dayPrice} VND',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffFFB800),
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
