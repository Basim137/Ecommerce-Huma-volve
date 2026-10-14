import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/categories_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/product_entity.dart';

abstract class HomeRepositry {
  Future<Either<ErrorModel, List<CategoryEntity>>> getAllCategories();

  Future<Either<ErrorModel, List<ProductEntity>>> getCategoryProduct(
    int categoryId,
  );
}
