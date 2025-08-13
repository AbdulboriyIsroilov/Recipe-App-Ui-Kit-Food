import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

import '../../../core/dio_core.dart';
import '../../../data/models/Login_model/login_model.dart';


class LoginViewModel extends ChangeNotifier {


  Future<Result<String>> fetchLogin({required LoginModel authData}) async {
    var response = await dio.post(
        "/auth/login", data: authData);
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    return response.data["accessToken"];
  }
}
