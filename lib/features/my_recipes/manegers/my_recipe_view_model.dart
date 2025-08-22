import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipe_repository/my_recipes_repositoriy.dart';

import '../../../data/models/home_model/recipes_model.dart';

class MyRecipeViewModel extends ChangeNotifier {
  MyRecipeViewModel({
    required MyRecipesRepositoriy myRecipeRepo,
  }) : _myRecipeRepo = myRecipeRepo {
    fetchMyRecipes();
  }

  final MyRecipesRepositoriy _myRecipeRepo;

  List<RecipesModel> recipes = [];
  String? error;
  bool loading = true;

  Future<void> fetchMyRecipes() async {
    loading = true;

    notifyListeners();

    var result = await _myRecipeRepo.getAll();
    result.fold(
      (e) => error = e.toString(),
      (value) => recipes = value,
    );

    loading = false;
    notifyListeners();
  }
}
