import '../../../core/client.dart';
import '../../models/home_model/categories_model.dart';
import '../../models/home_model/recipes_model.dart';
import '../../models/home_model/top_chef_model.dart';


class HomeRepository {
  List<CategoriyModel> categoriy = [];

  Future<List<CategoriyModel>> getCategoriy() async {
    if (categoriy.isNotEmpty) return categoriy;

    var reseponse = await dio.get("/categories/list");

    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    categoriy = (reseponse.data as List)
        .map((item) => CategoriyModel.fromJson(item))
        .toList();
    return categoriy;
  }

  List<RecipesModel> recipe = [];

  Future<List<RecipesModel>> getRecipe() async {
    if (recipe.isNotEmpty) return recipe;

    var reseponse = await dio.get("/recipes/list?Page=6&Limit=2");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    recipe = (reseponse.data as List)
        .map((item) => RecipesModel.fromJson(item))
        .toList();
    return recipe;
  }

  List<TopChefModel> topChef = [];

  Future<List<TopChefModel>> getTopChef({required int limit,required int page}) async {
    if (topChef.isNotEmpty) return topChef;

    var reseponse = await dio.get("/top-chefs/list?Page=$page&Limit=$limit");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    topChef = (reseponse.data as List)
        .map((item) => TopChefModel.fromJson(item))
        .toList();
    return topChef;
  }

  List<RecipesModel> recently = [];

  Future<List<RecipesModel>> getRecently() async {
    if(recently.isNotEmpty) return recently;

    var reseponse = await dio.get("/recipes/list?Page=11&Limit=2");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    recently = (reseponse.data as List)
        .map((item) => RecipesModel.fromJson(item))
        .toList();
    return recently;
  }
}
