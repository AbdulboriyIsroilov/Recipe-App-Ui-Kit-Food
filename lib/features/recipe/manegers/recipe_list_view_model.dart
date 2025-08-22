import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/home_model/recipes_model.dart';

import '../../../core/client.dart';
import '../../../data/models/recipe_model/categories_model.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required int categoryId}) {
    fetchRecipeList(categoryId: categoryId);
  }

  List<RecipesModel> categories = [];
  bool loading = true;

  Future<void> fetchRecipeList({required int categoryId}) async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/list?Category=$categoryId");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    categories = (reseponse.data as List)
        .map((item) => RecipesModel.fromJson(item))
        .toList();
    loading = false;
    notifyListeners();
  }
}
