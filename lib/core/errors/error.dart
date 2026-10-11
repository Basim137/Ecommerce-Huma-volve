import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error_model.dart';

ErrorModel handleDioExpection(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorModel(errorMessage: 'connectionTimeout');
    case DioExceptionType.sendTimeout:
      return ErrorModel(errorMessage: 'sendTimeout');
    case DioExceptionType.receiveTimeout:
      return ErrorModel(errorMessage: 'receiveTimeout');
    case DioExceptionType.badCertificate:
      return ErrorModel(errorMessage: 'badCertificate');
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case 401:
          return ErrorModel(errorMessage: 'Unauzorized');
        ////////////////////still handle all expected response status code
        default:
          return ErrorModel(errorMessage: 'errorMessage');
      }
    case DioExceptionType.cancel:
      return ErrorModel(errorMessage: 'cancel');
    case DioExceptionType.connectionError:
      return ErrorModel(errorMessage: 'Network Error');
    case DioExceptionType.unknown:
      return ErrorModel(errorMessage: 'unKnown');
    case DioExceptionType.transformTimeout:
      return ErrorModel(errorMessage: 'transformTimeout');
  }
}
