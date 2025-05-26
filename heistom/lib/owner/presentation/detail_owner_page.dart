import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

class DetailOwnerPage extends StatefulWidget {
  const DetailOwnerPage({super.key, required this.owner});

  final UserEntity owner;

  @override
  State<DetailOwnerPage> createState() => _DetailOwnerPageState();
}

class _DetailOwnerPageState extends State<DetailOwnerPage>
    with TickerProviderStateMixin {
  final tabTitles = ['Bài đăng', 'Giới thiệu'];

  late final tabController =
      TabController(length: tabTitles.length, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 32,
            backgroundImage: Image.file(File(widget.owner.avatar ?? '')).image,
          ),
          const SizedBox(height: 8),
          Text(
            widget.owner.name ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            widget.owner.phone ?? '',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff8D959D)),
          ),
          const SizedBox(height: 12),
          TabBar(
            controller: tabController,
            labelColor: Color(0xff21C3FF),
            indicatorColor: Color(0xff21C3FF),
            tabs: tabTitles
                .map((e) => Tab(
                    child: Text(e,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                _postView,
                _introductionView,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _postView => Column(
        children: [
          Row(
            children: [
              Text(
                'Bài đăng (7)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Icon(
                Icons.sort,
                color: Color(0xff8D959D),
                size: 24,
              ),
            ],
          ),
        ],
      ).paddingAll(16);

  Widget get _introductionView => Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 24,
                color: Color(0xff22313F),
              ),
              Text('${widget.owner.address}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff22313F))),
            ],
          ),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.phone,
                size: 24,
                color: Color(0xff22313F),
              ),
              Text('${widget.owner.phone}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff22313F))),
            ],
          )
        ],
      ).paddingAll(16);
}
