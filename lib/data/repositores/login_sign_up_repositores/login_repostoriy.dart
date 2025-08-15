import 'package:recipe_app_ui_kit_food/data/models/Login_model/login_model.dart';

import '../../../core/dio_core.dart';
import '../../../core/utils/result.dart';

class LoginRepository {
  final ApiClint _client;

  LoginRepository({required ApiClint client}) : _client = client;

  Future<Result<String>> login({
    required LoginModel data,
  }) async {
    var response = await _client.post(
      "/auth/login",
      data: data.toJson()
    );
    return response.fold(
      (error) {
        print("Repostory Error $error");
        return Result.error(error);
      },
      (success) {
        print("Repostory Success $success");
        return Result.ok(success["accessToken"]);
      },
    );
  }
}
