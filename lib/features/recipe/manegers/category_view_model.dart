import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/categories_repository.dart';

import '../../../data/models/category_models/category_model.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel({required CategoriesRepository recipeRepo}) : _recipeRepo = recipeRepo {
    fetchRecipe();
  }

  final CategoriesRepository _recipeRepo;
  List<CategoryModel> recipe = [];
  bool loading = true;
  String? errorMassege;

  Future<void> fetchRecipe() async {
    loading = true;
    notifyListeners();

    var result = await _recipeRepo.getCategory();
    result.fold(
          (error) => errorMassege = error.toString(),
          (value) => recipe = value,
    );

    loading = false;
    notifyListeners();
  }
}
