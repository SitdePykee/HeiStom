import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/renter/presentation/widgets/housecard_tile.dart';

class HousecardViewVertical extends StatelessWidget {
  HousecardViewVertical({super.key, required this.houses});

  final List<LodgingEntity> houses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: houses
            .map((house) => Column(
                  children: [
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    HousecardTile(
                      lodging: house,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
