import 'package:get/get.dart';

import '../../data/repository/owner_lodging_repository.dart';

class OwnerCreateHomestayController extends GetxController {
  final ownerLodgingRepository = OwnerLodgingRepository();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> createLodging(Map<String, dynamic> data) async {
    try {
      isLoading.value = true;
      await ownerLodgingRepository.createLodging(data);

      Get.snackbar('Tạo homestay', 'Khởi tạo homestay thành công');
    } catch (e) {
      Get.snackbar('Tạo homestay', 'Khởi tạo homestay thất bại');
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
