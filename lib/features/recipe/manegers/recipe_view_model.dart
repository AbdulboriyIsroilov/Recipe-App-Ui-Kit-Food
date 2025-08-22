import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipe_repository/recipe_repository.dart';

import '../../../data/models/recipe_model/recipe_model.dart';

class RecipeViewModel extends ChangeNotifier {
  RecipeViewModel({required RecipeRepository recipeRepo})
    : _recipeRepo = recipeRepo{
    fetchRecipe();
  }
  final RecipeRepository _recipeRepo;
  List<RecipeModel> recipe = [];
  bool loading = true;
  String? error;

  Future<void> fetchRecipe() async {
    loading = true;
    notifyListeners();

    var result = await _recipeRepo.getAll();


    result.fold(((e){
      // print("error : $e");
      return error = e.toString();
    }), (value){
      // print("value : $value");
      return recipe = value;
    });

    loading = false;
    notifyListeners();
  }
}
