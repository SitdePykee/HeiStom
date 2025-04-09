import 'package:flutter/material.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view_grid.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view_vertical.dart';
import 'package:heistom/renter/presentation/widgets/searchbar.dart';

import '../../../common/domain/entity/lodging_entity.dart';
import '../../../common/domain/entity/user_entity.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
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
                child: FakeSearchBar(),
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
