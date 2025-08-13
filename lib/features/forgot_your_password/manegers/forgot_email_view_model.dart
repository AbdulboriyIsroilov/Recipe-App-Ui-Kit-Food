import 'package:flutter/material.dart';

import '../../../core/dio_core.dart';

class ForgotEmailViewModel extends ChangeNotifier{


  Future<void> fetchForgotEmail() async {
    var response = await dio.post("");
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
  }
}
