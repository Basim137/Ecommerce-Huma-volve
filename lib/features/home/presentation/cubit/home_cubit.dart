import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/errors/error_model.dart';
import 'package:ecommerce_app_huma_volve/core/internet/dio_way.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data%20source/home_remote_data_src.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/repo/home_repo_implementation.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/categories_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/use%20case/home_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/presentation/cubit/home_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStatus> {
  int limit = 10;
  int offset = 0;
  int selectedCat = 0;
  bool loadingMore = false;
  bool hasMore = true;
  List<CategoryEntity> categoriesList = [];

  List<ProductEntity> products = [];
  HomeRepoImplementation remoteDataSrs = HomeRepoImplementation(
    HomeRemoteDataSrc(DioWay(Dio())),
  );
  late GetCategoriesUseCase getCategoriesUseCase;
  late GetProductsUseCase getProductsUseCase;

  HomeCubit(super.initialState) {
    getCategoriesUseCase = GetCategoriesUseCase(remoteDataSrs);
    getProductsUseCase = GetProductsUseCase(remoteDataSrs);
  }

  void getCategories() async {
    emit(LoadingCategoryProducts());

    Either<ErrorModel, List<CategoryEntity>> categories =
        await getCategoriesUseCase.invoke();

    categories.fold(
      (left) {
        emit(FailureCategoryProducts(errorMessage: left.errorMessage));
      },
      (right) {
        categoriesList = right;
        emit(SuccessCategoryProducts(categories: right));

        if (categoriesList.isEmpty) return;
        categoryProductsWithId(right.first.categoryId ?? 1);
      },
    );
  }

  void categoryProductsWithId(int id) async {
    hasMore = true;

    products.clear();
    emit(LoadingProducts());

    Either<ErrorModel, List<ProductEntity>> categories =
        await getProductsUseCase.invoke(
          categoryId: id,
          limit: limit,
          offest: offset,
        );

    categories.fold(
      (left) {
        emit(FailureProducts(errorMessage: left.errorMessage));
      },
      (right) {
        products.addAll(right);
        offset = right.length;
        if (right.length < limit) {
          hasMore = false;
        }
        selectedCat = id;
        emit(SuccessProducts(products: right));
      },
    );
  }

  void getMoreProducts() async {
    if (loadingMore || !hasMore) {
      return;
    }

    loadingMore = true;

    emit(MoreProductsLoading());

    final newProducts = await getProductsUseCase.invoke(
      categoryId: selectedCat,
      limit: limit,
      offest: offset,
    );

    newProducts.fold(
      (error) {
        emit(MoreProductsFailure(error));
      },
      (data) {
        products.addAll(data);
        offset += data.length;
        if (data.length < limit) {
          hasMore = false;
        }
        emit(MoreProductsSuccess(products: data));
      },
    );
  }
}
