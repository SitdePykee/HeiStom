import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';
import 'package:heistom/renter/presentation/widgets/housecard_tile_view.dart';

class SearchResultPage extends StatelessWidget {
  SearchResultPage({super.key});

  final SearchHouseController controller = Get.find<SearchHouseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final List<LodgingEntity> houses = controller.results;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Text(
                        "${houses.length} kết quả được tìm thấy",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                if (houses.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "Không tìm thấy kết quả nào.",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                  )
                else
                  HousecardViewVertical(houses: houses),
              ],
            ),
          ),
        );
      }),
    );
  }
}
