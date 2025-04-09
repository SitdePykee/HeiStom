import 'package:flutter/material.dart';
import 'package:heistom/common/entities/lodging.dart';
import 'package:heistom/renter/presentation/widgets/housecard_vertical.dart';

class HousecardViewVertical extends StatelessWidget {
  HousecardViewVertical(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.houses});

  final String title;
  final Function() onPressed;
  final List<Lodging> houses;

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
                  onPressed: () {},
                  child: Text(
                    'Xem tất cả',
                    style: TextStyle(fontSize: 16, color: Color(0xff0163E0)),
                  ))
            ],
          ),
          SizedBox(height: 12),
          Column(
            children: houses
                .map((house) => HouseCardVertical(
                      lodging: house,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
