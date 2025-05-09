import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view.dart';
import 'package:heistom/renter/presentation/widgets/housecard_tile_view.dart';

class SearchResultPage extends StatelessWidget {
  SearchResultPage({super.key});

  SearchHouseController controller = Get.find<SearchHouseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    "${controller.results.length} kết quả được tìm thấy",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list,
                        color: Colors.blue,
                      ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              HousecardViewVertical(houses: controller.results),
            ],
          ),
        ),
      ),
    );
  }
}
