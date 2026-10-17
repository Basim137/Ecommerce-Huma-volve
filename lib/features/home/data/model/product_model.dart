import 'package:ecommerce_app_huma_volve/core/constants/strings/end_points.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/model/categories_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  final String? slug;

  final CategoryModel? categoryModel;

  ProductModel({
    super.id,
    super.img,
    super.title,
    super.desc,
    this.slug,
    super.price,
    this.categoryModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      img: jsonData[ApiKeys.images][0],
      title: jsonData[ApiKeys.title],
      desc: jsonData[ApiKeys.desc],
      price: jsonData[ApiKeys.price],
      slug: jsonData[ApiKeys.categorySlug],
      categoryModel: CategoryModel.fromJson(jsonData[ApiKeys.category]),
      id: jsonData[ApiKeys.id],
    );
  }
}
