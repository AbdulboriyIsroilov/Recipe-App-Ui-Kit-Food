import 'package:recipe_app_ui_kit_food/core/client.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';
import 'package:recipe_app_ui_kit_food/data/models/community_model/community_model.dart';

class CommunityRepository {
  CommunityRepository({required ApiClient clint}) : _clint = clint;

  final ApiClient _clint;

  Future<Result<List<CommunityModel>>> getAll(Map<String, dynamic> queryParams) async {
    var response = await _clint.get<List>("/recipes/community/list", queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(
        val.map((item) => CommunityModel.fromJson(item)).toList(),
      ),
    );
  }
}
