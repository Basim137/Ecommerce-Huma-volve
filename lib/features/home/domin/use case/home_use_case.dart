import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/repo/home_repo_implementation.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/categories_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/product_entity.dart';

class GetCategoriesUseCase {
  HomeRepoImplementation homeRepoImplementation;

  GetCategoriesUseCase(this.homeRepoImplementation);

  Future<Either<ErrorModel, List<CategoryEntity>>> invoke() {
    return homeRepoImplementation.getAllCategories();
  }
}

class GetProductsUseCase {
  HomeRepoImplementation homeRepoImplementation;

  GetProductsUseCase(this.homeRepoImplementation);

  Future<Either<ErrorModel, List<ProductEntity>>> invoke({
    required int categoryId,
  }) {
    return homeRepoImplementation.getCategoryProduct(categoryId);
  }
}
