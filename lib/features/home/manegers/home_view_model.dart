import 'package:flutter/material.dart';
import '../../../core/dio_core.dart';

import '../../../data/models/home_model/categories_model.dart';
import '../../../data/models/home_model/recently_model.dart';
import '../../../data/models/home_model/recipes_model.dart';
import '../../../data/models/home_model/top_chef_model.dart';
import '../../../data/models/home_model/trending_recipe_model.dart';
import '../../../data/repositores/home_repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required HomeRepository categoriyRepo,
    required HomeRepository recipeRepo,
    required HomeRepository topChefRepo,
    required HomeRepository topRecently,
  }) : _categoriyRepo = categoriyRepo,
       _recipeRepo = recipeRepo,
       _topChefRepo = topChefRepo,
       _topRecently = topRecently {
    fetchTrendingRecipe();
  }

  final HomeRepository _categoriyRepo, _recipeRepo, _topChefRepo, _topRecently;

  String? categoriyError,recipeError,topChefError,recentlyError;

  bool categoriyLoading = true,
      trendingRecipeLoading = true,
      recipeLoading = true,
      topChefLoading = true,
      recentlyLoading = true;

  List<CategoriyModel> categoriy = [];

  Future<void> fetchCategoriy() async {
    categoriyLoading = true;
    notifyListeners();

    try {
      categoriy = await _categoriyRepo.getCategoriy();
    } catch (exception) {
      categoriyError = exception.toString();
    }

    categoriyLoading = false;
    notifyListeners();
  }

  late TrendingRecipeModel trendingRecipe;

  Future<void> fetchTrendingRecipe() async {
    trendingRecipeLoading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/trending-recipe");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    trendingRecipe = TrendingRecipeModel.fromJson(
      (reseponse.data as Map<String, dynamic>),
    );

    trendingRecipeLoading = false;
    notifyListeners();
  }

  List<RecipesModel> recipe = [];

  Future<void> fetchRecipe() async {
    recipeLoading = true;
    notifyListeners();

    try {
      recipe = await _recipeRepo.getRecipe();
    } catch (exception) {
      recipeError = exception.toString();
    }

    recipeLoading = false;
    notifyListeners();
  }

  List<TopChefModel> topChef = [];

  Future<void> fetchTopChef({required int limit,required int page}) async {
    topChefLoading = true;
    notifyListeners();

    try {
      topChef = await _topChefRepo.getTopChef(limit: limit, page: page);
    } catch (exception) {
      topChefError = exception.toString();
    }

    topChefLoading = false;
    notifyListeners();
  }

  List<RecentlyModel> recently = [];

  Future<void> fetchRecently() async {
    recentlyLoading = true;
    notifyListeners();

    try {
      recently = await _topRecently.getRecently();
    } catch (exception) {
      recentlyError = exception.toString();
    }

    recentlyLoading = false;
    notifyListeners();
  }
}
