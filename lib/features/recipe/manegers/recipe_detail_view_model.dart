import 'package:flutter/material.dart';

import '../../../core/dio_core.dart';

class RecipeDetailViewModel extends ChangeNotifier{
  RecipeDetailViewModel({required int categoryId}){
    fetchRecipeDetail(categoryId: categoryId);
  }
  Map details = {};
  bool loading = true;

  Future<void> fetchRecipeDetail({required int categoryId}) async{
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/detail/$categoryId");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    details = reseponse.data;
    loading = false;
    notifyListeners();
  }
}