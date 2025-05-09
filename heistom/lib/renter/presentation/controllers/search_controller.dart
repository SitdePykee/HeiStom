import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:heistom/common/amenities.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

class SearchHouseController extends GetxController {
  var searchQuery = ''.obs;
  final searchController = TextEditingController();
  var checkInDate = DateTime.now().obs;
  var checkOutDate = DateTime.now().add(const Duration(days: 1)).obs;
  var peopleCount = 1.obs;
  var roomCount = 1.obs;
  var results = <LodgingEntity>[
    LodgingEntity(
      id: '1',
      name: 'Omina Hanoi Hotel & Travel',
      address: '2B Phố Hàng Gà, Quận Hoàn Kiếm, Hà Nội',
      area: 90,
      amenities: ['free_wifi', 'bike_to_airport'],
      dayPrice: 100,
      hourPrice: 2000,
      rating: 5.0,
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
      rating: 4.0,
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
      rating: 4.5,
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
      rating: 4.2,
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
      rating: 4.8,
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
  ].obs;

  var selectedAmenities = <Amenities>[].obs;

  void toggleAmenity(Amenities amenity) {
    selectedAmenities.contains(amenity)
        ? selectedAmenities.remove(amenity)
        : selectedAmenities.add(amenity);
  }

  void clearAmenities() {
    selectedAmenities.clear();
  }
}
