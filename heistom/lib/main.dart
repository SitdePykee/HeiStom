import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/authentication/presentation/login_page.dart';
import 'package:heistom/common/data/model/lodging_model.dart';
import 'package:heistom/common/data/model/user_model.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/lodging/presentation/pages/detail_lodging_page.dart';
import 'package:heistom/renter/presentation/pages/homepage.dart';

import 'owner/presentation/detail_owner_page.dart';
import 'package:get/get.dart';

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
    amenities: [
      'free_wifi',
      'bike_to_airport',
    ],
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
      home: HomePage(),
    );
  }
}
