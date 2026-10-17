import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data%20source/home_remote_data_src.dart';

import 'package:ecommerce_app_huma_volve/features/home/domin/entity/categories_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/repo/home_repositry.dart';

class HomeRepoImplementation extends HomeRepositry {
  HomeRemoteDataSrc homeRemoteDataSrc;
  HomeRepoImplementation(this.homeRemoteDataSrc);
  @override
  Future<Either<ErrorModel, List<CategoryEntity>>> getAllCategories() async {
    try {
      List<CategoryEntity> categories = await homeRemoteDataSrc
          .getAllCategory();

      return Right(categories);
    } on DioException catch (error) {
      return Left(handleDioExpection(error));
    }
  }

  @override
  Future<Either<ErrorModel, List<ProductEntity>>> getCategoryProduct(
    int categoryId, {
    required int limit,
    required int offest,
  }) async {
    try {
      List<ProductEntity> products = await homeRemoteDataSrc
          .getCategoryPrpducts(categoryId, limit: limit, offest: offest);
      return Right(products);
    } on DioException catch (error) {
      return Left(handleDioExpection(error));
    }
  }
}
