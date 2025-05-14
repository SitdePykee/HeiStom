import 'package:dio/dio.dart';
import 'package:heistom/common/data/model/user_model.dart';
import 'package:heistom/common/global_controller.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  Dio dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8080/v1';
  GlobalController globalController = Get.find<GlobalController>();

  Future<void> signIn(String email, String password) async {
    try {
      final response = await dio.post(
        '$baseUrl/user/auth',
        data: {
          'username': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data['data']);
        globalController.user = user.toEntity();
      } else {
        // Handle error
      }
    } catch (e) {
      rethrow;
    }
  }
}
