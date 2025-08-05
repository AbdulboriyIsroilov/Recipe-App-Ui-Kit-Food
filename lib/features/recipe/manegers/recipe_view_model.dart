import 'package:flutter/material.dart';

import '../../../core/dio_core.dart';
import '../../../data/recipe_model/recipe_model.dart';

class RecipeViewModel extends ChangeNotifier {
  RecipeViewModel() {
    fetchRecipe();
  }

  List<RecipeModel> recipe = [];
  bool loading = true;

  Future<void> fetchRecipe() async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/categories/list");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    recipe = (reseponse.data as List)
        .map((item) => RecipeModel.fromJson(item))
        .toList();

    loading = false;
    notifyListeners();
  }
}
