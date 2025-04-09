import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/renter/presentation/widgets/housecard_grid.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HousecardViewGrid extends StatelessWidget {
  HousecardViewGrid(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.houses});

  final String title;
  final Function() onPressed;
  final List<LodgingEntity> houses;

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
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 16,
            children: houses.map((house) {
              return StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: HouseCardGrid(lodging: house),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
