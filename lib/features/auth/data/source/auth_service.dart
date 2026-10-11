import 'package:ecommerce_app_huma_volve/core/constants/strings/end_points.dart';
import 'package:ecommerce_app_huma_volve/core/internet/api_consumer.dart';

class AuthService {
  ApiConsumer apiConsumer;

  AuthService(this.apiConsumer);

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    return (await apiConsumer.post(
      endpoint: EndPoints.login,
      data: {ApiKeys.email: email, ApiKeys.password: password},
    )).data;
  }

  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
    required String username,
    required String role,
    required String avater,
  }) async {
    return (await apiConsumer.post(
      endpoint: EndPoints.register,
      data: {
        ApiKeys.email: email,
        ApiKeys.avatar: avater,
        ApiKeys.name: username,
        ApiKeys.password: password,
        ApiKeys.role: role,
      },
    )).data;
  }
}
