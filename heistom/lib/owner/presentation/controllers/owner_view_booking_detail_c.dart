import 'package:get/get.dart';
import 'package:heistom/owner/data/repository/owner_lodging_repository.dart';

import '../../data/model/lodging_booking_detail_model.dart';

class OwnerViewBookingDetailController extends GetxController {
  OwnerViewBookingDetailController({required this.bookingId});

  final String bookingId;

  final ownerRepository = OwnerLodgingRepository();

  final bookingDetail = Rxn<LodgingBookingDetailModel>();

  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getBookingDetail();
  }

  Future<void> getBookingDetail() async {
    isLoading.value = true;
    final response =
        await ownerRepository.getBookingDetail(bookingId: bookingId);
    bookingDetail.value = response;
    isLoading.value = false;
  }
}
