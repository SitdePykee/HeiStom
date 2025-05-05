import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/street_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';
import 'package:heistom/renter/presentation/widgets/choose_amenities_dialog.dart';
import 'package:heistom/renter/presentation/widgets/counter_tile.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view.dart';

import 'package:get/get.dart';
import 'package:heistom/renter/presentation/widgets/streetcard_view.dart';

import '../../../common/domain/entity/lodging_entity.dart';
import '../../../common/domain/entity/user_entity.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalController globalController = Get.find<GlobalController>();
  final TextEditingController _searchController = TextEditingController();
  final SearchHouseController controller = Get.put(SearchHouseController());

  final List<Map<String, String>> suggestions = [
    {'name': 'Phố Hàng Bài', 'address': 'Phường Hàng Bài'},
    {'name': 'Phố Hàng Gà', 'address': 'Phường Cửa Đông'},
    {
      'name': 'Hotel de Lagom',
      'address': '30 B-C-D Lý Nam Đế, phường Cửa Đông'
    },
    {'name': 'HN Memori Hotel', 'address': '90 Trần Nhật Duật'},
  ];

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
                  image: NetworkImage(globalController.user.avatar!),
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
                  globalController.user.name!,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: TypeAheadField<LodgingEntity>(
                  suggestionsCallback: (String search) {
                    return houses.where((lodging) {
                      final query = search.toLowerCase();
                      return lodging.name!.toLowerCase().contains(query) ||
                          lodging.address!.toLowerCase().contains(query);
                    }).toList();
                  },
                  builder: (context, controller, focusNode) {
                    return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Color(0xff0090FF),
                            size: 30,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Bạn muốn đi đâu?',
                        ));
                  },
                  itemBuilder: (context, houses) {
                    return ListTile(
                      title: Text(houses.name!),
                      subtitle: Text(houses.address!),
                      leading: Icon(
                        Icons.location_on_outlined,
                      ),
                    );
                  },
                  onSelected: (house) {},
                ),
              ),
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
                    SizedBox(
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
                leading: Icon(
                  Icons.list,
                  color: Color(0xff0090FF),
                ),
                title: Text('Chọn tiện ích'),
                trailing: Icon(Icons.arrow_drop_down),
                onTap: () {
                  showAmenitiesDialog();
                },
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff0090FF),
                      Color(0xff00FF94),
                    ],
                    stops: [0.038, 1.2615],
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
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
              HousecardView(
                  onPressed: () {}, houses: houses, title: 'Địa điểm hàng đầu'),
            ],
          ),
        ),
      ),
    );
  }
}

List<LodgingEntity> houses = [
  LodgingEntity(
    id: '1',
    name: 'Omina Hanoi Hotel & Travel',
    address: '2B Phố Hàng Gà, Quận Hoàn Kiếm, Hà Nội',
    area: 90,
    amenities: ['free_wifi', 'bike_to_airport'],
    dayPrice: 100,
    hourPrice: 2000,
    image: [
      'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20027687-898dcd1210075992ae96b15357f919f0.jpeg?_src=imagekit&tr=c-at_max,f-jpg,h-360,pr-true,q-80,w-640'
    ],
    description:
        'Khách sạn nằm tại trung tâm Hà Nội, thuận tiện đi lại và có đầy đủ tiện nghi.',
    owner: UserEntity(
      id: 'u1',
      name: 'Nguyễn Văn A',
      email: 'vana@example.com',
      phone: '0987654321',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime(2024, 10, 1).millisecondsSinceEpoch,
    lat: 21.033,
    lng: 105.848,
  ),
  LodgingEntity(
    id: '2',
    name: 'Sunrise Da Nang Hotel',
    address: '123 Nguyễn Văn Thoại, Quận Sơn Trà, Đà Nẵng',
    area: 120,
    amenities: ['free_wifi', 'pool', 'gym'],
    dayPrice: 150,
    hourPrice: 2500,
    image: [
      'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20027687-898dcd1210075992ae96b15357f919f0.jpeg?_src=imagekit&tr=c-at_max,f-jpg,h-360,pr-true,q-80,w-640'
    ],
    description: 'Nghỉ dưỡng ven biển với không gian yên tĩnh và hiện đại.',
    owner: UserEntity(
      id: 'u2',
      name: 'Trần Thị B',
      email: 'tranthib@example.com',
      phone: '0912345678',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime(2024, 10, 5).millisecondsSinceEpoch,
    lat: 16.061,
    lng: 108.237,
  ),
  LodgingEntity(
    id: '3',
    name: 'Saigon Cozy House',
    address: '45 Lê Văn Sỹ, Quận 3, TP.HCM',
    area: 75,
    amenities: ['free_wifi', 'kitchen', 'parking'],
    dayPrice: 80,
    hourPrice: 1800,
    image: [
      'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20027687-898dcd1210075992ae96b15357f919f0.jpeg?_src=imagekit&tr=c-at_max,f-jpg,h-360,pr-true,q-80,w-640'
    ],
    description: 'Phù hợp cho gia đình hoặc nhóm bạn, gần trung tâm TP.HCM.',
    owner: UserEntity(
      id: 'u3',
      name: 'Lê Quốc C',
      email: 'lequocc@example.com',
      phone: '0909123456',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime(2024, 9, 20).millisecondsSinceEpoch,
    lat: 10.784,
    lng: 106.690,
  ),
  LodgingEntity(
    id: '4',
    name: 'The Garden Homestay Hue',
    address: '25 Nguyễn Huệ, TP. Huế',
    area: 60,
    amenities: ['garden', 'wifi', 'breakfast'],
    dayPrice: 70,
    hourPrice: 1600,
    image: [
      'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20027687-898dcd1210075992ae96b15357f919f0.jpeg?_src=imagekit&tr=c-at_max,f-jpg,h-360,pr-true,q-80,w-640'
    ],
    description: 'Homestay có sân vườn thoáng đãng và phong cách cổ kính.',
    owner: UserEntity(
      id: 'u4',
      name: 'Phạm Duy D',
      email: 'phamduyd@example.com',
      phone: '0978123456',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime(2024, 8, 15).millisecondsSinceEpoch,
    lat: 16.462,
    lng: 107.598,
  ),
  LodgingEntity(
    id: '5',
    name: 'Mountain View Villa Sapa',
    address: 'Đồi Mường Hoa, Thị xã Sapa',
    area: 150,
    amenities: ['mountain_view', 'fireplace', 'wifi'],
    dayPrice: 180,
    hourPrice: 3000,
    image: [
      'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20027687-898dcd1210075992ae96b15357f919f0.jpeg?_src=imagekit&tr=c-at_max,f-jpg,h-360,pr-true,q-80,w-640'
    ],
    description:
        'Biệt thự nghỉ dưỡng nhìn ra dãy Hoàng Liên Sơn, yên tĩnh và sang trọng.',
    owner: UserEntity(
      id: 'u5',
      name: 'Hoàng Anh E',
      email: 'hoanganhe@example.com',
      phone: '0967987654',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime(2024, 7, 10).millisecondsSinceEpoch,
    lat: 22.336,
    lng: 103.843,
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
