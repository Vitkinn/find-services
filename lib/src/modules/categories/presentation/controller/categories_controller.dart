import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/categories/domain/entities/category_entity.dart';
import 'package:tcc_frontend/src/modules/categories/domain/usecases/get_categories_usecase.dart';

class CategoriesController {
  final GetCategoriesUseCase _getCategoriesUseCase = GetCategoriesUseCase();
  late final List<CategoryEntity> _categories;

  void loadCategories() {
    _categories = _getCategoriesUseCase.getCategories();
  }

  int getCategoriesSize() {
    return _categories.length;
  }

  CategoryEntity getCategory(int index) {
    return _categories[index];
  }

  String getCategoryName(int index) {
    return _categories[index].name!;
  }

  String getCategoryDescription(int index) {
    return _categories[index].description!;
  }

  Image getCategoryImage(String categoryName) {
    categoryName = categoryName.toLowerCase();
    return Image.asset('lib/assets/images/${categoryName}_category.png');
  }
}
