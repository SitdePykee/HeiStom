import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/street_entity.dart';
import 'package:heistom/renter/presentation/widgets/housecard.dart';
import 'package:heistom/renter/presentation/widgets/streetcard.dart';

import '../../../common/domain/entity/lodging_entity.dart';

class StreetcardView extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final List<StreetEntity> streets;

  const StreetcardView(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.streets});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'Xem tất cả',
                    style: TextStyle(fontSize: 16, color: Color(0xff0163E0)),
                  ))
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: streets
                        .map((street) => Streetcard(
                              street: street,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
