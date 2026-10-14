import 'package:ecommerce_app_huma_volve/core/constants/strings/end_points.dart';
import 'package:ecommerce_app_huma_volve/features/home/domin/entity/categories_entity.dart';

class CategoryModel extends CategoryEntity {
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryModel({
    super.categoryId,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
    super.categoryName,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
    : super(categoryId: json[ApiKeys.id], categoryName: json[ApiKeys.name]) {
    slug = json[ApiKeys.categorySlug];
    image = json[ApiKeys.image];
    creationAt = json[ApiKeys.categoryCreation];
    updatedAt = json[ApiKeys.categoryUpdated];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[ApiKeys.id] = categoryId;
    data[ApiKeys.name] = categoryName;
    data[ApiKeys.categorySlug] = slug;
    data[ApiKeys.image] = image;
    data[ApiKeys.categoryCreation] = creationAt;
    data[ApiKeys.categoryUpdated] = updatedAt;
    return data;
  }
}
