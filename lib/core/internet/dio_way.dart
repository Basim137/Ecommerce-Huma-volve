import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/constants/strings/end_points.dart';
import 'package:ecommerce_app_huma_volve/core/internet/api_consumer.dart';

class DioWay extends ApiConsumer {
  Dio dio;

  DioWay(this.dio) {
    dio.options.baseUrl = EndPoints.baseUrl;
  }

  @override
  Future<Response<dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  @override
  Future<Response<dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}
