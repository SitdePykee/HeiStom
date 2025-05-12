import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

class GlobalController extends GetxController {
  late UserEntity user;

  @override
  void onInit() {
    user = UserEntity();
    super.onInit();
  }
}
