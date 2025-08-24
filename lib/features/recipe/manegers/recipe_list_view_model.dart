import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/home_model/recipes_model.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipe_repository/recipe_repository.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({
    required int categoryId,
    required RecipeRepository recipeRepo,
  }) : _recipeRepo = recipeRepo {
    fetchRecipeList(categoryId: categoryId);
  }

  final RecipeRepository _recipeRepo;
  List<RecipesModel> recipes = [];
  bool loading = true;
  String? errorMassege;

  Future<void> fetchRecipeList({required int categoryId}) async {
    loading = true;
    notifyListeners();
    var result = await _recipeRepo.getRecipes(categoryId: categoryId);
    result.fold(
      (error) {
        return errorMassege = error.toString();
      },
      (value) {
        return recipes = value;
      },
    );
    loading = false;
    notifyListeners();
  }
}
