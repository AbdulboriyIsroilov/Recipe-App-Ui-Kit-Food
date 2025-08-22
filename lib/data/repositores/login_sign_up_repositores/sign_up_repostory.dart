import 'package:recipe_app_ui_kit_food/core/client.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

import '../../models/Login_model/sign_up_model.dart';

class SignUpRepostory {
  final ApiClient _client;

  SignUpRepostory({required ApiClient client}) : _client = client ;

  Future<Result<String>> signUp({
    required SignUpModel data,
  }) async {
    var reseponse = await _client.post(
      "/auth/register",
      data: data.toJson()
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
