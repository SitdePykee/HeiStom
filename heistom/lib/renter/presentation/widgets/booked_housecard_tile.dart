import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/presentation/pages/bill_review_page.dart';

class BookedHousecardTile extends StatelessWidget {
  final BillEntity bill;

  BookedHousecardTile({
    super.key,
    required this.bill,
  });

  @override
  Widget build(BuildContext context) {
    final lodging = bill.lodging;

    return InkWell(
      onTap: () {
        if (bill != null) {
          Get.to(
            () => BillReviewPage(
              bill: bill,
            ),
            transition: Transition.rightToLeft,
          );
        }
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: (lodging?.image != null && lodging!.image!.isNotEmpty)
                ? Image.asset(
                    lodging.image!.first,
                    width: 87,
                    height: 87,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 87,
                        height: 87,
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.image,
                          size: 32,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  )
                : Container(
                    width: 87,
                    height: 87,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image,
                      size: 32,
                      color: Colors.grey[600],
                    ),
                  ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lodging?.name ?? 'No name',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4),
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
                      lodging?.rating?.toString() ?? '0',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(width: 14),
                    Text(
                      '${lodging?.reviews?.length ?? 0} đánh giá',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  lodging?.address ?? 'Không có địa chỉ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  lodging?.dayPrice != null
                      ? '${lodging!.dayPrice} VND'
                      : 'Giá không xác định',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffFFB800),
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
