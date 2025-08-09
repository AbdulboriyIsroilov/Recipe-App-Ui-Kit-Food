import 'package:flutter/material.dart';

import '../../../data/models/on_boarding_model/cuisine_model.dart';
import '../../../data/repositores/on_boarding_repositores/cuisines_repository.dart';

class CuisinesViewModel extends ChangeNotifier {
  CuisinesViewModel({required CuisinesRepository cuisineRepo})
    : _cuisineRepo = cuisineRepo;

  String? error;
  final CuisinesRepository _cuisineRepo;
  List<CuisineModel> cuisine = [];
  bool loading = true;

  Future<void> fetchAllergic() async {
    loading = true;
    notifyListeners();

    try {
      cuisine = await _cuisineRepo.getAll();
    } catch (exception) {
      error = exception.toString();
    }

    loading = false;
    notifyListeners();
  }
}
