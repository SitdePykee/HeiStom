import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/review_entity.dart';
import 'package:heistom/common/domain/entity/street_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/renter/data/search_repository.dart';
import 'package:heistom/renter/data/utils_repository.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';
import 'package:heistom/renter/presentation/pages/search_result_page.dart';
import 'package:heistom/renter/presentation/widgets/choose_amenities_dialog.dart';
import 'package:heistom/renter/presentation/widgets/counter_tile.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view.dart';

import 'package:get/get.dart';
import 'package:heistom/renter/presentation/widgets/streetcard_view.dart';

import '../../../common/domain/entity/lodging_entity.dart';
import '../../../common/domain/entity/user_entity.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalController globalController = Get.find<GlobalController>();
  final SearchHouseController controller = Get.put(SearchHouseController());
  final SearchRepository searchRepository = Get.find<SearchRepository>();
  final UtilsRepository utilsRepository = UtilsRepository();

  final RxList<LodgingEntity> houses = <LodgingEntity>[].obs;

  void showAmenitiesDialog() {
    Get.dialog(ChooseAmenitiesDialog());
  }

  void showCupertinoDatePicker({
    required BuildContext context,
    required DateTime initialDateTime,
    required ValueChanged<DateTime> onDateTimeChanged,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          initialDateTime: initialDateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          use24hFormat: true,
          onDateTimeChanged: onDateTimeChanged,
        ),
      ),
    );
  }

  void getLodging() async {
    final result = await utilsRepository.getLodgings();
    houses.assignAll(result);
  }

  @override
  void initState() {
    super.initState();
    getLodging();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F7),
        title: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(globalController.user.avatar ??
                      'https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Chào buổi sáng',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  globalController.user.name ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (houses.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: TypeAheadField<LodgingEntity>(
                    controller: controller.searchController,
                    suggestionsCallback: (String search) {
                      final query = search.toLowerCase();
                      return houses.where((lodging) =>
  lodging.name!.toLowerCase().contains(query) ||
  lodging.address!.toLowerCase().contains(query)).toList();

                    },
                    builder: (context, textController, focusNode) {
                      return TextField(
                        controller: textController,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xff0090FF),
                            size: 30,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Bạn muốn đi đâu?',
                        ),
                      );
                    },
                    itemBuilder: (context, lodging) {
                      return ListTile(
                        title: Text(lodging.name ?? ''),
                        subtitle: Text(lodging.address ?? ''),
                        leading: const Icon(Icons.location_on_outlined),
                      );
                    },
                    onSelected: (lodging) {
                      controller.searchController.text = lodging.name ?? '';
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Obx(() => ListTile(
                      leading: const Icon(Icons.calendar_today,
                          color: Color(0xff0090FF)),
                      title: const Text('Thời gian nhận phòng'),
                      subtitle: Text(
                        '${controller.checkInDate.value.day.toString().padLeft(2, '0')}/'
                        '${controller.checkInDate.value.month.toString().padLeft(2, '0')}/'
                        '${controller.checkInDate.value.year} '
                        '${controller.checkInDate.value.hour.toString().padLeft(2, '0')}:'
                        '${controller.checkInDate.value.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: const Icon(Icons.arrow_drop_down),
                      onTap: () {
                        showCupertinoDatePicker(
                          context: context,
                          initialDateTime: controller.checkInDate.value,
                          onDateTimeChanged: (date) {
                            controller.checkInDate.value = date;
                          },
                        );
                      },
                    )),
                Obx(() => ListTile(
                      leading: const Icon(Icons.calendar_today,
                          color: Color(0xff0090FF)),
                      title: const Text('Thời gian trả phòng'),
                      subtitle: Text(
                        '${controller.checkOutDate.value.day.toString().padLeft(2, '0')}/'
                        '${controller.checkOutDate.value.month.toString().padLeft(2, '0')}/'
                        '${controller.checkOutDate.value.year} '
                        '${controller.checkOutDate.value.hour.toString().padLeft(2, '0')}:'
                        '${controller.checkOutDate.value.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: const Icon(Icons.arrow_drop_down),
                      onTap: () {
                        showCupertinoDatePicker(
                          context: context,
                          initialDateTime: controller.checkOutDate.value,
                          onDateTimeChanged: (date) {
                            controller.checkOutDate.value = date;
                          },
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => CounterTile(
                            label: 'Người',
                            value: controller.peopleCount.value,
                            icon: Icons.people_outline,
                            onChanged: (newValue) =>
                                controller.peopleCount.value = newValue,
                          )),
                      const SizedBox(
                        height: 40,
                        child: VerticalDivider(
                          color: Colors.black54,
                          width: 1,
                          thickness: 2,
                        ),
                      ),
                      Obx(() => CounterTile(
                            label: 'Phòng',
                            value: controller.roomCount.value,
                            icon: Icons.hotel_outlined,
                            onChanged: (newValue) =>
                                controller.roomCount.value = newValue,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.list,
                    color: Color(0xff0090FF),
                  ),
                  title: const Text('Chọn tiện ích'),
                  trailing: const Icon(Icons.arrow_drop_down),
                  onTap: () {
                    showAmenitiesDialog();
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0090FF), Color(0xff00FF94)],
                      stops: [0.038, 1.2615],
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      controller.results.value = await searchRepository.searchLodgings();
                      Get.to(() => SearchResultPage());
                    },
                    child: const Text(
                      'Tìm kiếm',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                StreetcardView(
                    title: 'Khu vực đông khách',
                    onPressed: () {},
                    streets: streets),
                const SizedBox(height: 16),
                // HousecardView(
                //   onPressed: () {},
                //   houses: houses,
                //   title: 'Địa điểm hàng đầu',
                //   isSearched: false,
                // ),
              ],
            ),
          ),
        );
      }),
    );
  }
}


List<ReviewEntity> sampleReviews = [
  ReviewEntity(
    id: 'r1',
    rating: 4.8,
    reviewer: UserEntity(
      id: 'u1',
      name: 'John Doe',
      avatar: 'https://example.com/avatar1.png',
    ),
    lodgingID: 'l1',
    comment: 'Amazing place, highly recommended!',
    postAt:
        DateTime.now().subtract(Duration(minutes: 5)).millisecondsSinceEpoch,
  ),
  ReviewEntity(
    id: 'r2',
    rating: 4.5,
    reviewer: UserEntity(
      id: 'u2',
      name: 'Alice Smith',
      avatar: 'https://example.com/avatar2.png',
    ),
    lodgingID: 'l1',
    comment: 'Very comfortable and clean.',
    postAt: DateTime.now().subtract(Duration(hours: 2)).millisecondsSinceEpoch,
  ),
  ReviewEntity(
    id: 'r3',
    rating: 3.9,
    reviewer: UserEntity(
      id: 'u3',
      name: 'Bob Johnson',
      avatar: 'https://example.com/avatar3.png',
    ),
    lodgingID: 'l1',
    comment: 'Good but could be better.',
    postAt: DateTime.now().subtract(Duration(days: 1)).millisecondsSinceEpoch,
  ),
  ReviewEntity(
    id: 'r4',
    rating: 5.0,
    reviewer: UserEntity(
      id: 'u4',
      name: 'Emily Clark',
      avatar: 'https://example.com/avatar4.png',
    ),
    lodgingID: 'l1',
    comment: 'Perfect for a family vacation!',
    postAt: DateTime.now().subtract(Duration(days: 30)).millisecondsSinceEpoch,
  ),
  ReviewEntity(
    id: 'r5',
    rating: 4.2,
    reviewer: UserEntity(
      id: 'u5',
      name: 'David Brown',
      avatar: 'https://example.com/avatar5.png',
    ),
    lodgingID: 'l1',
    comment: 'Nice place but a bit noisy at night.',
    postAt: DateTime.now().subtract(Duration(days: 365)).millisecondsSinceEpoch,
  ),
];



final streets = [
  StreetEntity(
    id: '1',
    name: 'Nguyễn Huệ',
    image: 'https://redsvn.net/wp-content/uploads/2020/03/Pho-Hang-Bai-01.jpg',
  ),
  StreetEntity(
    id: '2',
    name: 'Lê Lợi',
    image: 'https://redsvn.net/wp-content/uploads/2020/03/Pho-Hang-Bai-01.jpg',
  ),
  StreetEntity(
    id: '3',
    name: 'Trần Hưng Đạo',
    image: 'https://redsvn.net/wp-content/uploads/2020/03/Pho-Hang-Bai-01.jpg',
  ),
  StreetEntity(
    id: '4',
    name: 'Phạm Ngũ Lão',
    image: 'https://redsvn.net/wp-content/uploads/2020/03/Pho-Hang-Bai-01.jpg',
  ),
  StreetEntity(
    id: '5',
    name: 'Pasteur',
    image: 'https://redsvn.net/wp-content/uploads/2020/03/Pho-Hang-Bai-01.jpg',
  ),
];
