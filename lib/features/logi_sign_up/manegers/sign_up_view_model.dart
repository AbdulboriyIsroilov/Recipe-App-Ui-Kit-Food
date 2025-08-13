import 'package:flutter/material.dart';

import '../../../core/dio_core.dart';

class SignUpViewModel extends ChangeNotifier{

  Future<String> signUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String birthDate,
    required String password,
  }) async {
    var reseponse = await dio.post(
      "/auth/register",
      data: {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "birthDate": birthDate,
        "password": password,
        "cookingLevelId": null,
      },
    );
    if (reseponse.statusCode != 201) {
      throw Exception(reseponse.data);
    }
    return reseponse.data["accessToken"];
  }
}
