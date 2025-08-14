import 'package:recipe_app_ui_kit_food/data/models/Login_model/login_model.dart';

import '../../../core/dio_core.dart';
import '../../../core/utils/result.dart';

class LoginRepostoriy {
  final ApiClint client;

  LoginRepostoriy({required this.client});

  Future<Result<String>> login({
    required LoginModel maps,
  }) async {
    var reseponse = await client.post(
      "/auth/login",
      data: {
        "login": maps.login,
        "password": maps.password,
      },
    );
    return reseponse.fold(
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
