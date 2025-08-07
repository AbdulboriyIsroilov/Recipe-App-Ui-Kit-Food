import 'package:flutter/material.dart';

import '../../../core/dio_core.dart';
import '../../../data/on_boarding_model/allergic_model.dart';


class AllergicViewModel extends ChangeNotifier {
  AllergicViewModel() {
    fetchAllergic();
  }

  List<AllergicModel> allergic = [];
  bool loading = true;

  Future<void> fetchAllergic() async {
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/allergic/list");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    allergic = (reseponse.data as List)
        .map((item) => AllergicModel.fromJson(item))
        .toList();

    loading = false;
    notifyListeners();
  }
}
