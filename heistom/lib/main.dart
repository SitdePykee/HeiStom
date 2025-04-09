import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/authentication/presentation/login_page.dart';
import 'package:heistom/renter/presentation/pages/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
