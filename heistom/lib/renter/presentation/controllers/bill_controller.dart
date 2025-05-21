import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/bill_entity.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/renter/data/bill_repository.dart';

class BillController{
  RxString paymentMethod = 'Chuyển khoản'.obs;
  RxBool isTransfer() {
    if (paymentMethod.value == 'Chuyển khoản') {
      return true.obs;
    } else {
      return false.obs;
    }
  }

  double calculateTotal(int checkin, int checkout, LodgingEntity lodging, int numOfRooms, int numOfPeople){
    final durationMs = checkout - checkin;
    double totalPrice = 0;
    if (durationMs >= 86400000) {
      // Tính theo ngày
      final days = (durationMs / 86400000).ceil();
      totalPrice = (lodging.dayPrice ?? 0) * days * numOfRooms;
    } else {
      // Tính theo giờ
      final hours = (durationMs / 3600000).ceil();
      totalPrice = (lodging.hourPrice ?? 0) * hours * numOfRooms;
    }
    return totalPrice;
  }




  var lodging = Rx<LodgingEntity?>(null);

}