import 'package:flutter/material.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view_grid.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view_vertical.dart';
import 'package:heistom/renter/presentation/widgets/searchbar.dart';
import 'package:get/get.dart';

import '../../../common/domain/entity/lodging_entity.dart';
import '../../../common/domain/entity/user_entity.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  GlobalController globalController = Get.find<GlobalController>();
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.2),
                Color.fromRGBO(33, 195, 255, 0.2),
                Color.fromRGBO(255, 255, 255, 0.2),
              ],
              stops: [0.0, 0.505, 1.0],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Hero(
                    tag: 'searchbar',
                    child: Material(
                        color: Colors.transparent, child: FakeSearchBar())),
              ),
              SizedBox(
                height: 16,
              ),
              HousecardView(
                  title: 'Gợi ý', onPressed: () {}, houses: houseCards),
              SizedBox(
                height: 16,
              ),
              HousecardViewVertical(
                  title: 'Phòng mới đăng',
                  onPressed: () {},
                  houses: houseCards),
              SizedBox(
                height: 16,
              ),
              HousecardViewGrid(
                  title: 'Nhiều hơn nữa', onPressed: () {}, houses: houseCards),
            ],
          ),
        ),
      ),
    );
  }
}

List<LodgingEntity> houseCards = [
  LodgingEntity(
    id: '1',
    name: 'Omina Hanoi Hotel & Travel',
    address: '2B Phố Hàng Gà, Quận Hoàn Kiếm',
    area: 100,
    amenities: ['free_wifi', 'bike_to_airport'],
    pricePerDay: 100,
    pricePerMonth: 2000,
    image: ['assets/images/imgOnboarding2.jpeg'],
    description:
        ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
    views: 10,
    owner: UserEntity(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '1234567890',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime.now().millisecondsSinceEpoch,
    lat: 21.0285,
    lng: 105.8542,
  ),
  LodgingEntity(
    id: '1',
    name: 'Omina Hanoi Hotel & Travel',
    address: '2B Phố Hàng Gà, Quận Hoàn Kiếm',
    area: 100,
    amenities: ['free_wifi', 'bike_to_airport'],
    pricePerDay: 100,
    pricePerMonth: 2000,
    image: ['assets/images/imgOnboarding2.jpeg'],
    description:
        ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
    views: 10,
    owner: UserEntity(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '1234567890',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime.now().millisecondsSinceEpoch,
    lat: 21.0285,
    lng: 105.8542,
  ),
  LodgingEntity(
    id: '1',
    name: 'Omina Hanoi Hotel & Travel',
    address: '2B Phố Hàng Gà, Quận Hoàn Kiếm',
    area: 100,
    amenities: ['free_wifi', 'bike_to_airport'],
    pricePerDay: 100,
    pricePerMonth: 2000,
    image: ['assets/images/imgOnboarding2.jpeg'],
    description:
        ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
    views: 10,
    owner: UserEntity(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '1234567890',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime.now().millisecondsSinceEpoch,
    lat: 21.0285,
    lng: 105.8542,
  ),
  LodgingEntity(
    id: '1',
    name: 'Omina Hanoi Hotel & Travel',
    address: '2B Phố Hàng Gà, Quận Hoàn Kiếm',
    area: 100,
    amenities: ['free_wifi', 'bike_to_airport'],
    pricePerDay: 100,
    pricePerMonth: 2000,
    image: ['assets/images/imgOnboarding2.jpeg'],
    description:
        ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
    views: 10,
    owner: UserEntity(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '1234567890',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime.now().millisecondsSinceEpoch,
    lat: 21.0285,
    lng: 105.8542,
  ),
  LodgingEntity(
    id: '1',
    name: 'Omina Hanoi Hotel & Travel',
    address: '2B Phố Hàng Gà, Quận Hoàn Kiếm',
    area: 100,
    amenities: ['free_wifi', 'bike_to_airport'],
    pricePerDay: 100,
    pricePerMonth: 2000,
    image: ['assets/images/imgOnboarding2.jpeg'],
    description:
        ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
    views: 10,
    owner: UserEntity(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '1234567890',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime.now().millisecondsSinceEpoch,
    lat: 21.0285,
    lng: 105.8542,
  ),
  LodgingEntity(
    id: '1',
    name: 'Omina Hanoi Hotel & Travel',
    address: '2B Phố Hàng Gà, Quận Hoàn Kiếm',
    area: 100,
    amenities: ['free_wifi', 'bike_to_airport'],
    pricePerDay: 100,
    pricePerMonth: 2000,
    image: ['assets/images/imgOnboarding2.jpeg'],
    description:
        ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
    views: 10,
    owner: UserEntity(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '1234567890',
      avatar: 'assets/images/avatar.png',
    ),
    uploadDate: DateTime.now().millisecondsSinceEpoch,
    lat: 21.0285,
    lng: 105.8542,
  ),
];
