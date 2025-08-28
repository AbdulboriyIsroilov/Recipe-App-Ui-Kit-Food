import 'package:recipe_app_ui_kit_food/core/client.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';
import 'package:recipe_app_ui_kit_food/data/models/user/profile_model.dart';

import '../models/top_chef_models/top_chef_model.dart';

class UsersRepository {
  UsersRepository({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<Result<ProfileModel>> getAll() async {
    var response = await _client.get("/auth/me");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(ProfileModel.fromJson(val as Map<String, dynamic>)),
    );
  }

  Future<Result<List<TopChefModel>>> getTopChef({required int limit, required int page}) async {
    var response = await _client.get<List>("/top-chefs/list?Page=$page&Limit=$limit");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(val.map((item) => TopChefModel.fromJson(item)).toList()),
    );
  }

  Future<Result<ProfileModel>> getTopChefDetail({required int id}) async {
    var response = await _client.get("/auth/details/$id");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(ProfileModel.fromJson(val as Map<String, dynamic>)),
    );
  }
}
