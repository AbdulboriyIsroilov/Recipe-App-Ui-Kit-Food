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

  void fetchLogin({
    required LoginModel authModel,
    required VoidCallback onError,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await _loginRepo.login(data: authModel);

      data.fold(
        (e) {
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
