import 'package:get/get.dart';
import 'package:heistom/common/global_controller.dart';

import '../../../common/domain/entity/lodging_entity.dart';
import '../../data/repository/owner_lodging_repository.dart';

class OwnerHomePageController extends GetxController {
  final globalController = Get.find<GlobalController>();

  final OwnerLodgingRepository _ownerLodgingRepository =
      OwnerLodgingRepository();

  final isLoading = RxBool(false);

  final myLodgings = RxList<LodgingEntity>();

  @override
  void onInit() {
    super.onInit();
    getMyLodgings();
  }

  Future<void> getMyLodgings() async {
    isLoading.value = true;
    final response = await _ownerLodgingRepository.getOwnerLodgings(
      ownerId: globalController.user.id ?? '',
    );

    myLodgings.value = response;
    isLoading.value = false;
  }
}
