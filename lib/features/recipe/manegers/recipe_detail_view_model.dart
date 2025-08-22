import 'package:flutter/material.dart';

import '../../../core/client.dart';
import '../../../data/models/recipe_model/detail_model.dart';

class RecipeDetailViewModel extends ChangeNotifier{
  RecipeDetailViewModel({required int categoryId}){
    fetchRecipeDetail(categoryId: categoryId);
  }
  late DetailModel details;
  bool loading = true;

  Future<void> fetchRecipeDetail({required int categoryId}) async{
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/detail/$categoryId");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    details = DetailModel.fromJson(reseponse.data as Map<String, dynamic>);
    loading = false;
    notifyListeners();
  }
}