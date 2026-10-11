import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/source/auth_service.dart';

class AuthRepo {
  AuthService authService;

  AuthRepo(this.authService);

  Future<Either<String, ErrorModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> jsonData = await authService.loginUser(
        email: email,
        password: password,
      );
      //jsonData for Caching Later
      return Left('Success Login');
    } on DioException catch (e) {
      return Right(handleDioExpection(e));
    } catch (e) {
      return Right(ErrorModel(errorMessage: 'errorMessage'));
    }
  }

  Future<Either<String, ErrorModel>> register({
    required String email,
    required String password,
    required String username,
    required String role,
    required String avater,
  }) async {
    try {
      Map<String, dynamic> jsonData = await authService.registerUser(
        email: email,
        password: password,
        username: username,
        avater: avater,
        role: role,
      );

      //jsonData for Caching Later
      return Left('Success Register ');
    } on DioException catch (e) {
      return Right(handleDioExpection(e));
    } catch (e) {
      return Right(ErrorModel(errorMessage: 'errorMessage'));
    }
  }
}
