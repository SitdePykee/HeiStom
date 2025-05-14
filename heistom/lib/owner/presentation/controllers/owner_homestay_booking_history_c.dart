import 'package:get/get.dart';
import 'package:heistom/common/extensions/num_extensions.dart';
import 'package:heistom/owner/data/repository/owner_lodging_repository.dart';

class OwnerHomestayBookingHistoryController extends GetxController {
  OwnerHomestayBookingHistoryController({required this.lodgingId});

  final String lodgingId;

  final OwnerLodgingRepository _ownerLodgingRepository =
      OwnerLodgingRepository();

  final selectedDate = Rx<DateTime>(DateTime.now());

  final bookings = RxList<Map<String, String>>([]);

  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getRoomStatus();
  }

  Future<void> getRoomStatus() async {
    isLoading.value = true;
    final response = await _ownerLodgingRepository.getRoomStatus(
      lodgingId: lodgingId,
    );

    bookings.assignAll(response
        .map((e) => {
              'room': e.room?.roomName?.toString() ?? '',
              'date':
                  '${e.booking?.checkInAt?.toDateString() ?? ''} - ${e.booking?.checkOutAt?.toDateString() ?? ''}',
              'customer': e.user?.name ?? '',
            })
        .toList());

    isLoading.value = false;
  }

  void changeMonth(int offset) {
    selectedDate.value =
        DateTime(selectedDate.value.year, selectedDate.value.month + offset, 1);
  }
}
