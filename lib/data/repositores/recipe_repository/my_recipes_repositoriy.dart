import 'package:recipe_app_ui_kit_food/core/client.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

import '../../models/home_model/recipes_model.dart';

class MyRecipesRepositoriy {
  MyRecipesRepositoriy({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<Result<List<RecipesModel>>> getAll() async {
    var response = await _client.get<List>("/recipes/my-recipes");
    return response.fold(
      (error) {
        return Result.error(error);
      },
      (val) {
        return Result.ok(val.map((item) => RecipesModel.fromJson(item)).toList(),);
      },
    );
  }
}
