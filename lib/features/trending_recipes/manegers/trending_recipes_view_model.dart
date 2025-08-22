import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/trending_recipes_model/trending_recipes_model.dart';

import '../../../core/client.dart';

class TrendingRecipesViewModel extends ChangeNotifier{
  TrendingRecipesViewModel(){
    fetchTrendingRecipes();
  }
  late TrendingRecipeModel details;
  bool loading = true;

  Future<void> fetchTrendingRecipes() async{
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/trending-recipe");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    details = TrendingRecipeModel.fromJson(reseponse.data as Map<String, dynamic>);
    loading = false;
    notifyListeners();
  }
}
