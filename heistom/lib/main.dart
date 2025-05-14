import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/authentication/presentation/login_page.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/domain/entity/review_entity.dart';
import 'package:heistom/common/domain/entity/street_entity.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/owner/presentation/detail_owner_page.dart';
import 'package:heistom/owner/presentation/pages/owner_create_homestay_page.dart';
import 'package:heistom/owner/presentation/pages/owner_home_page.dart';
import 'package:heistom/renter/presentation/pages/booked_homestay_page.dart';
import 'package:heistom/renter/presentation/pages/favorited_homestay_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
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
        return FavoritedHomestayPage(
          lodgings: houses,
        );
      case 2:
        return BookedHomestayPage(
          lodgings: houses,
        );
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

List<LodgingEntity> houses = [
  LodgingEntity(
    id: '1',
    name: 'Omina Hanoi Hotel & Travel',
    address: '2B Phố Hàng Gà, Quận Hoàn Kiếm, Hà Nội',
    area: 90,
    rating: 3.5,
    reviews: sampleReviews,
    amenities: [
      'free_wifi',
      'gym',
      'free_breakfast',
      'children_friendly',
      'free_parking',
      'pet_friendly',
      'air_conditioning',
      'swimming_pool',
      'bar',
      'private_dining_room',
      'bike_to_airport'
    ],
    dayPrice: 100,
    hourPrice: 2000,
    image: [
      'https://vanangroup.com.vn/wp-content/uploads/2024/10/29df21cd740c64fda44d8e567685970b-e1729733600172.jpg',
      'https://cf.bstatic.com/xdata/images/hotel/max1024x768/234762091.jpg?k=45540c95d66e3278d194a4a35994dd3491811d644b2a6cb3e3da1b187dfa7d06&o=&hp=1',
      'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20027687-898dcd1210075992ae96b15357f919f0.jpeg?_src=imagekit&tr=c-at_max,f-jpg,h-360,pr-true,q-80,w-640',
      'https://vanangroup.com.vn/wp-content/uploads/2024/10/29df21cd740c64fda44d8e567685970b-e1729733600172.jpg',
      'https://cf.bstatic.com/xdata/images/hotel/max1024x768/234762091.jpg?k=45540c95d66e3278d194a4a35994dd3491811d644b2a6cb3e3da1b187dfa7d06&o=&hp=1',
      'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20027687-898dcd1210075992ae96b15357f919f0.jpeg?_src=imagekit&tr=c-at_max,f-jpg,h-360,pr-true,q-80,w-640',
      'https://vanangroup.com.vn/wp-content/uploads/2024/10/29df21cd740c64fda44d8e567685970b-e1729733600172.jpg',
      'https://cf.bstatic.com/xdata/images/hotel/max1024x768/234762091.jpg?k=45540c95d66e3278d194a4a35994dd3491811d644b2a6cb3e3da1b187dfa7d06&o=&hp=1',
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
