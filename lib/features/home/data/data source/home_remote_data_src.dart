import 'package:ecommerce_app_huma_volve/core/constants/strings/end_points.dart';
import 'package:ecommerce_app_huma_volve/core/internet/api_consumer.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/categories_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/product_model.dart';

class HomeRemoteDataSrc {
  ApiConsumer apiConsumer;

  HomeRemoteDataSrc(this.apiConsumer);

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      List jsonData = (await apiConsumer.get(
        endpoint: EndPoints.getCategories,
      )).data;

      return jsonData.map((toCategory) {
        return CategoryModel.fromJson(toCategory);
      }).toList();
    } catch (error) {
      rethrow;
    }
  }

  //
  Future<List<ProductModel>> getCategoryPrpducts(
    int categoryId, {
    required int limit,
    required int offest,
  }) async {
    try {
      List jsonData = (await apiConsumer.get(
        endpoint: EndPoints.getCategoryProducts(categoryId),

        queryParameters: {
          ApiKeys.limit: limit.toString(),
          ApiKeys.offest: offest.toString(),
        },
      )).data;

      return jsonData.map((item) {
        return ProductModel.fromJson(item);
      }).toList();
    } catch (error) {
      rethrow;
    }
  }
}
