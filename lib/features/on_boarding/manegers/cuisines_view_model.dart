import 'package:flutter/material.dart';

import '../../../core/dio_core.dart';
import '../../../data/on_boarding_model/cuisine_model.dart';


class CuisinesViewModel extends ChangeNotifier {
  CuisinesViewModel() {
    fetchCuisine();
  }

  List<CuisineModel> cuisine = [];
  bool loading = true;

  Future<void> fetchCuisine() async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/cuisines/list");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    cuisine = (reseponse.data as List)
        .map((item) => CuisineModel.fromJson(item))
        .toList();

    loading = false;
    notifyListeners();
  }
}
