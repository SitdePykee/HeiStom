import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';

var popularSearch = [
  'Phố Hàng Bài',
  'homestay 4 người',
  'gần Hồ Gươm',
  'homestay sang trọng Phố Cổ',
  'giá rẻ',
];

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  SearchHouseController searchController = SearchHouseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 56,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'searchbar',
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          controller: searchController.searchController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm "Tro Ha Dong",...',
                            hintStyle: TextStyle(
                                fontSize: 16, color: Color(0xffB8BDC2)),
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Color(0xffF7F7F7),
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Hủy', style: TextStyle(color: Colors.blue))),
                ],
              ),
            ),
          ),
          Text(
            'Tìm kiếm phổ biến',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ).paddingSymmetric(horizontal: 16, vertical: 8),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PopularSearchView(
                popularSearch: popularSearch,
                searchController: searchController),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Gợi ý',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ).paddingSymmetric(horizontal: 16, vertical: 8),
        ],
      ),
    ));
  }
}

class PopularSearchView extends StatelessWidget {
  final SearchHouseController searchController;
  final List<String> popularSearch;

  PopularSearchView({
    super.key,
    required this.searchController,
    required this.popularSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 8,
        children: popularSearch
            .map((e) => PopularSearchChip(
                  title: e,
                  searchController: searchController,
                ))
            .toList());
  }
}

class PopularSearchChip extends StatelessWidget {
  final String title;
  final SearchHouseController searchController;

  const PopularSearchChip({
    super.key,
    required this.title,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        searchController.searchController.text = title;
      },
      child: Chip(
        label: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Color(0xffF7F7F7),
        side: BorderSide.none,
      ),
    );
  }
}
