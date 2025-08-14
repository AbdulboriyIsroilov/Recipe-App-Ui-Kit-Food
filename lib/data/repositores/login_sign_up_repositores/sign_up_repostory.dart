import 'package:recipe_app_ui_kit_food/core/dio_core.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

import '../../models/Login_model/sign_up_model.dart';

class SignUpRepostory {
  final ApiClint client;

  SignUpRepostory({required this.client});

  Future<Result<String>> signUp({
    required SignUpModel maps,
  }) async {
    var reseponse = await client.post(
      "/auth/register",
      data: {
        "username": maps.username,
        "firstName": maps.firstName,
        "lastName": maps.lastName,
        "email": maps.email,
        "phoneNumber": maps.phoneNumber,
        "birthDate": maps.birthDate,
        "password": maps.password,
        "cookingLevelId": null,
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
