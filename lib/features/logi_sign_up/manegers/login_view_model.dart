import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/Login_model/login_model.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/login_sign_up_repositores/login_repostoriy.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({
    required LoginRepository loginRepo,
  }) : _loginRepo = loginRepo;

  final LoginRepository _loginRepo;
  bool isLoading = true;
  String token = "";
  String? errorMessage;

  void fetchLogin({
    required LoginModel authModel,
    required VoidCallback onError,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await _loginRepo.login({
        "login": authModel.login,
        "password": authModel.password,
      });

      data.fold(
        (e) {
          errorMessage = e.toString();
          onError();
        },
        (success) {
          token = success;
          onSuccess();
        },
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
