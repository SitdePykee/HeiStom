import 'package:flutter/material.dart';
import 'package:heistom/renter/presentation/widgets/housecard.dart';

class HousecardView extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final List<HouseCard> houseCards;

  const HousecardView(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.houseCards});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: houseCards.length,
          itemBuilder: (context, index) {
            return HouseCard();
          },
        )
      ],
    );
  }
}
