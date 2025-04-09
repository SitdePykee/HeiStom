import 'package:flutter/material.dart';
import 'package:heistom/common/data/model/lodging.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view_grid.dart';
import 'package:heistom/renter/presentation/widgets/housecard_view_vertical.dart';
import 'package:heistom/renter/presentation/widgets/searchbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Lodging> houseCards = [
    Lodging(
        id: '1',
        name: 'Omina Hanoi Hotel & Travel',
        address: '2B Phố Hàng Gà, Quận Hoàn Kiếm',
        acreage: 100,
        amenities: ['Wifi', 'Parking'],
        pricePerDay: 100,
        pricePerMonth: 2000,
        image: 'assets/images/imgOnboarding2.jpeg',
        description:
            ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
        views: 10,
        ownerID: 'owner1'),
    Lodging(
        id: '1',
        name: 'House 1',
        address: 'Location 1',
        acreage: 100,
        amenities: ['Wifi', 'Parking'],
        pricePerDay: 100,
        pricePerMonth: 2000,
        image: 'assets/images/imgOnboarding2.jpeg',
        description:
            ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
        views: 10,
        ownerID: 'owner1'),
    Lodging(
        id: '1',
        name: 'House 1',
        address: 'Location 1',
        acreage: 100,
        amenities: ['Wifi', 'Parking'],
        pricePerDay: 100,
        pricePerMonth: 2000,
        image: 'assets/images/imgOnboarding2.jpeg',
        description:
            ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
        views: 10,
        ownerID: 'owner1'),
    Lodging(
        id: '1',
        name: 'House 1',
        address: 'Location 1',
        acreage: 100,
        amenities: ['Wifi', 'Parking'],
        pricePerDay: 100,
        pricePerMonth: 2000,
        image: 'assets/images/imgOnboarding2.jpeg',
        description:
            ' Des cri ption Desc ri ption Descr iptionDe scrip tion Descrip tion Descr iption ',
        views: 10,
        ownerID: 'owner1'),
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
