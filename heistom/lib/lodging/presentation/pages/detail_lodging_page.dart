import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/common/domain/entity/room_entity.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:heistom/lodging/presentation/widgets/lodging_detail_view.dart';
import 'package:heistom/lodging/presentation/widgets/lodging_images_view.dart';
import 'package:heistom/lodging/presentation/widgets/lodging_review_view.dart';
import 'package:heistom/renter/presentation/pages/bill_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailLodgingPage extends StatefulWidget {
  DetailLodgingPage({super.key, required this.lodging, this.isSearched = true});

  final LodgingEntity lodging;
  bool isSearched;

  @override
  _DetailLodgingPageState createState() => _DetailLodgingPageState();
}

class _DetailLodgingPageState extends State<DetailLodgingPage> {
  int _selectedIndex = 0;

  void _onSegmentChanged(Set<int> selected) {
    setState(() {
      _selectedIndex = selected.first;
    });
  }

  //fixed code
  late BillEntity bill;
  GlobalController globalController = Get.find<GlobalController>();
  @override
  void initState() {
    super.initState();

    bill = BillEntity(
      id: '1',
      lodging: widget.lodging,
      user: globalController.user,
      numberOfPeople: 2,
      room: [
        RoomEntity(capacity: 2, id: '101'),
        RoomEntity(capacity: 2, id: '102'),
      ],
      checkInDate: DateTime.now().millisecondsSinceEpoch,
      checkOutDate:
          DateTime.now().add(Duration(days: 2)).millisecondsSinceEpoch,
      totalPrice: 2000000.0,
      paymentMethod: 'Thẻ tín dụng',
    );
  }

  //fixed code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 24,
          ),
        ),
        actions: [
          InkWell(
            // hai anh code dinh vl
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String favorited = prefs.getString(widget.lodging.id!) ?? '';
              await prefs.setString('favorited', favorited);
            },
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      persistentFooterButtons: [
        if (widget.isSearched)
          InkWell(
            onTap: () {
              Get.off(BillPage(bill: bill));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: Color(0xff21C3FF),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  'Đặt phòng',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          )
      ],
      body: Column(
        children: [
          widget.lodging.image != null && widget.lodging.image!.isNotEmpty
              ? Image.network(
                  widget.lodging.image!.first,
                  fit: BoxFit.cover,
                )
              : const Placeholder(
                  color: Colors.grey,
                  fallbackHeight: 240,
                ),
          const SizedBox(height: 15),
          SegmentedButton<int>(
            selected: <int>{_selectedIndex},
            onSelectionChanged: _onSegmentChanged,
            showSelectedIcon: false,
            style: SegmentedButton.styleFrom(
              backgroundColor: Colors.white,
              selectedBackgroundColor: Colors.blue,
            ),
            segments: [
              ButtonSegment(
                value: 0,
                label: Text(
                  'Chi tiết',
                  style: TextStyle(
                    color:
                        _selectedIndex == 0 ? Colors.white : Color(0xff21C3FF),
                  ),
                ),
              ),
              ButtonSegment<int>(
                value: 1,
                label: Text(
                  'Ảnh (${widget.lodging.image?.length ?? 0})',
                  style: TextStyle(
                    color:
                        _selectedIndex == 1 ? Colors.white : Color(0xff21C3FF),
                  ),
                ),
              ),
              ButtonSegment<int>(
                value: 2,
                label: Text(
                  'Đánh giá (${widget.lodging.reviews?.length ?? 0})',
                  style: TextStyle(
                    color:
                        _selectedIndex == 2 ? Colors.white : Color(0xff21C3FF),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: _selectedIndex == 0
                ? LodgingDetailView(lodging: widget.lodging)
                : _selectedIndex == 1
                    ? LodgingImagesView(lodging: widget.lodging)
                    : LodgingReviewView(lodging: widget.lodging),
          ),
        ],
      ),
    );
  }
}
