import 'package:recipe_app_ui_kit_food/core/client.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

import '../../models/recipe_model/recipe_model.dart';

class RecipeRepository {
  RecipeRepository({required ApiClient clint}) : _clint = clint;

  final ApiClient _clint;

  Future<Result<List<RecipeModel>>> getAll() async {
    var response = await _clint.get<List>("/categories/list");
    return response.fold(
      ((error) {
        // print("repo error : $error");
        return Result.error(error);
      }),
      (onSuccess) {
        // print("repo onSuccess: $onSuccess");
        return Result.ok(
          onSuccess.map((item) => RecipeModel.fromJson(item)).toList(),
        );
      },
    );
  }
}
