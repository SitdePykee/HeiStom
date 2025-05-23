import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/data/bill_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/renter/presentation/widgets/housecard_tile.dart';

class FavoritedHomestayPage extends StatefulWidget {
  const FavoritedHomestayPage({Key? key}) : super(key: key);

  @override
  State<FavoritedHomestayPage> createState() => _FavoritedHomestayPageState();
}

class _FavoritedHomestayPageState extends State<FavoritedHomestayPage> {
  List<LodgingEntity> lodgings = [];
  bool isLoading = true;

  final GlobalController globalController = Get.find<GlobalController>();
  final BillRepository billRepository = Get.find<BillRepository>();

  @override
  void initState() {
    super.initState();
    _loadFavoritedLodgings();
  }

  Future<void> _loadFavoritedLodgings() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> favoritedIds = [];
    try {
      favoritedIds = prefs.getStringList('favorited') ?? [];
    } catch (e) {
      await prefs.remove('favorited');
      favoritedIds = [];
    }

    if (favoritedIds.isEmpty) {
      setState(() {
        lodgings = [];
        isLoading = false;
      });
      return;
    }

    List<LodgingEntity> results = [];
    for (String id in favoritedIds) {
      try {
        final lodging = await billRepository.getLodgingById(id);
        results.add(lodging);
      } catch (e) {
        print('Lỗi khi load lodging id=$id: $e');
      }
    }

    setState(() {
      lodgings = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F7),
        title: Row(
          children: [
            if (globalController.user.avatar != null)
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: FileImage(File(globalController.user.avatar!)),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              const SizedBox(width: 48, height: 48),
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
                  globalController.user.name ?? 'Người dùng',
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : lodgings.isEmpty
              ? const Center(
                  child: Text(
                    'Bạn chưa có phòng yêu thích nào.',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        'Danh sách phòng yêu thích',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: lodgings
                              .map(
                                (lodging) => Column(
                                  children: [
                                    HousecardTile(lodging: lodging),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
