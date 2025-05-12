import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/data/model/lodging_model.dart';
import 'package:heistom/common/data/model/user_model.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/owner/presentation/detail_owner_page.dart';
import 'package:heistom/owner/presentation/pages/owner_create_homestay_page.dart';
import 'package:heistom/owner/presentation/pages/owner_home_page.dart';
import 'package:heistom/renter/presentation/pages/homepage.dart';

import 'owner/presentation/pages/owner_booking_list_page.dart';
import 'owner/presentation/pages/owner_edit_personal_info_page.dart';
import 'owner/presentation/pages/owner_statistics_page.dart';

void main() {
  Get.put(GlobalController());
  Get.put<GlobalController>(GlobalController());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final lodging = LodgingModel(
    id: '1',
    name: 'Lodging 1',
    address: 'Address 1',
    dayPrice: 100,
    hourPrice: 1000,
    image: [
      'https://hnm.1cdn.vn/2020/11/07/nhipsonghanoi.hanoimoi.com.vn-uploads-images-phananh-2020-11-04-_cafe6.jpg',
      'https://hnm.1cdn.vn/2020/11/07/nhipsonghanoi.hanoimoi.com.vn-uploads-images-phananh-2020-11-04-_cafe6.jpg',
      'https://hnm.1cdn.vn/2020/11/07/nhipsonghanoi.hanoimoi.com.vn-uploads-images-phananh-2020-11-04-_cafe6.jpg',
    ],
    description: 'Description 1',
    amenities: ['free_wifi', 'bike_to_airport'],
    owner: UserModel(
      id: '1',
      name: 'Owner 1',
      avatar:
          'https://sohanews.sohacdn.com/160588918557773824/2025/4/8/elon-musk-2025-worlds-richest-pe-11330752-1744127633018-17441276334511812934978.jpg',
      phone: '0909090909',
    ),
    area: 100,
    uploadDate:
        DateTime.now().subtract(Duration(days: 1)).millisecondsSinceEpoch,
    lat: 21.028511,
    lng: 105.804817,
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: NavBarScreen(),
    );
  }
}

class NavBarScreen extends StatefulWidget {
  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;

  final GlobalController globalController = Get.find();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: globalController.user.role == 'USER'
          ? _getUserSelectedPage()
          : _getOwnerSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: globalController.user.role == 'USER'
            ? [
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.favorite, 1),
                _buildNavItem(Icons.house, 2),
                _buildNavItem(Icons.person, 3),
              ]
            : [
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.add_box_rounded, 1),
                _buildNavItem(Icons.chair_rounded, 2),
                _buildNavItem(Icons.equalizer_rounded, 3),
                _buildNavItem(Icons.person, 4),
              ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Container(
            height: 3,
            width: 20,
            color: _selectedIndex == index ? Colors.black : Colors.transparent,
            margin: EdgeInsets.only(bottom: 2),
          ),
          Icon(icon),
        ],
      ),
      label: '',
    );
  }

  Widget _getUserSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return OwnerHomePage();
      case 1:
        return Placeholder();
      case 2:
        return Placeholder();
      case 3:
        return DetailOwnerPage(
          owner: UserEntity(
            id: '1',
            name: 'Owner 1',
            avatar:
                'https://sohanews.sohacdn.com/160588918557773824/2025/4/8/elon-musk-2025-worlds-richest-pe-11330752-1744127633018-17441276334511812934978.jpg',
            phone: '0909090909',
          ),
        );
      default:
        return HomePage();
    }
  }

  Widget _getOwnerSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return OwnerHomePage();
      case 1:
        return OwnerCreateHomestayPage();
      case 2:
        return OwnerBookingListPage();
      case 3:
        return OwnerStatisticsPage();
      default:
        return OwnerEditPersonalInfoPage();
    }
  }
}
