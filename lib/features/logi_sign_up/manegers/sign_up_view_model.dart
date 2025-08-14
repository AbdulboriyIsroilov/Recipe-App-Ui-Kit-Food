import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/Login_model/sign_up_model.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/login_sign_up_repositores/sign_up_repostory.dart';

import '../../../core/dio_core.dart';

class SignUpViewModel extends ChangeNotifier {
  bool isLoading = true;
  String token = "";

  void fetchSignUp({
    required SignUpModel authModel,
    required VoidCallback onError,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await SignUpRepostory(
        client: ApiClint(),
      ).signUp(maps: authModel);
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
