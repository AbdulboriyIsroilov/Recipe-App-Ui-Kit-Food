import 'package:flutter/material.dart';

import '../../../core/dio_core.dart';
import '../../../data/recipe_model/categories_model.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required int categoryId}) {
    fetchRecipeList(categoryId: categoryId);
  }

  List<CategoriesModel> categories = [];
  bool loading = true;

  Future<void> fetchRecipeList({required int categoryId}) async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/list?Category=$categoryId");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    categories = (reseponse.data as List)
        .map((item) => CategoriesModel.fromJson(item))
        .toList();
    loading = false;
    notifyListeners();
  }
}
