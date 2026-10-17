import 'package:ecommerce_app_huma_volve/core/errors/error_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/categories_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/product_entity.dart';

class HomeStatus {}

class InitialHomeStatus extends HomeStatus {}

class SuccessCategoryProducts extends HomeStatus {
  List<CategoryEntity> categories;
  SuccessCategoryProducts({required this.categories});
}

class FailureCategoryProducts extends HomeStatus {
  final String errorMessage;

  FailureCategoryProducts({required this.errorMessage});
}

class LoadingCategoryProducts extends HomeStatus {}
///////////////////////////////////////////////////////

class SuccessProducts extends HomeStatus {
  List<ProductEntity> products;
  SuccessProducts({required this.products});
}

class FailureProducts extends HomeStatus {
  final String errorMessage;

  FailureProducts({required this.errorMessage});
}

class LoadingProducts extends HomeStatus {}

////////////////////////
///
class MoreProductsFailure extends HomeStatus {
  ErrorModel error;

  MoreProductsFailure(this.error);
}

class MoreProductsLoading extends HomeStatus {}

class MoreProductsSuccess extends HomeStatus {
  List<ProductEntity> products;
  MoreProductsSuccess({required this.products});
}
