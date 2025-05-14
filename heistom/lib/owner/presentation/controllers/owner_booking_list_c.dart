import 'package:get/get.dart';
import 'package:heistom/owner/data/model/lodging_booking_model.dart';

import '../../../common/global_controller.dart';
import '../../data/repository/owner_lodging_repository.dart';

class OwnerBookingListController extends GetxController {
  final _ownerLodgingRepository = OwnerLodgingRepository();

  final globalController = Get.find<GlobalController>();

  final bookingList = RxList<LodgingBookingModel>();

  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getBookingList();
  }

  Future<void> getBookingList() async {
    isLoading.value = true;
    final response = await _ownerLodgingRepository.getOwnerLodgingBookings(
        ownerId: globalController.user.id ?? '');
    bookingList.value = response;
    isLoading.value = false;
  }
}
