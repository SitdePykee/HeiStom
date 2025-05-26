import 'package:dio/dio.dart';
import 'package:heistom/common/data/model/user_model.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  Dio dio = Dio(BaseOptions(
    connectTimeout: Duration(seconds: 300),
  ));
  final String baseUrl = 'http://localhost:8080/v1';
  GlobalController globalController = Get.find<GlobalController>();

  Future<void> signIn(String email, String password) async {
    final response = await dio.post(
      '$baseUrl/user/auth',
      data: {
        'username': email,
        'password': password,
      },
    );
    print(response.data);
    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(response.data['data']);
      globalController.user = user.toEntity();
    } else {
      print('Error signing in: ${response.statusCode}');
    }
  }
}
