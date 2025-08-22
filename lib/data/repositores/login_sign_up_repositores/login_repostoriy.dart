import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_app_ui_kit_food/data/models/Login_model/login_model.dart';

import '../../../core/client.dart';
import '../../../core/utils/result.dart';

class LoginRepository {
  final ApiClient _client;
  final FlutterSecureStorage _secureStorage;

  LoginRepository({
    required ApiClient client,
    required FlutterSecureStorage secureStorage,
  }) : _client = client,
       _secureStorage = secureStorage;

  Future<Result<String>> login(Map<String, dynamic> data) async {
    var response = await _client.post("/auth/login", data: data);
    return response.fold(
      (error) {
        return Result.error(error);
      },
      (success)  {
        _secureStorage.write(key: "token", value: success["accessToken"]);
        _secureStorage.write(key: "login", value: data["login"]);
        _secureStorage.write(key: "password", value: data["password"]);
        return Result.ok(success["accessToken"]);
      },
    );
  }
}
