import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

class GlobalController extends GetxController {
  UserEntity user = UserEntity(
      name: 'Vinh Lăn lông lốc',
      role: 'OWNER',
      avatar:
          'https://sohanews.sohacdn.com/160588918557773824/2025/4/8/elon-musk-2025-worlds-richest-pe-11330752-1744127633018-17441276334511812934978.jpg');
}
