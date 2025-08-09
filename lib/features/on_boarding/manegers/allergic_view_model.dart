import 'package:flutter/material.dart';

import '../../../data/models/on_boarding_model/allergic_model.dart';
import '../../../data/repositores/on_boarding_repositores/allergic_repository.dart';


class AllergicViewModel extends ChangeNotifier {
  AllergicViewModel({required AllergicRepository allergicRepo})
    : _allergicRepo = allergicRepo;

  String? error;
  final AllergicRepository _allergicRepo;
  List<AllergicModel> allergic = [];
  bool loading = true;

  Future<void> fetchAllergic() async {
    loading = true;
    notifyListeners();

    try {
      allergic = await _allergicRepo.getAll();
    } catch (exception) {
      error = exception.toString();
    }

    loading = false;
    notifyListeners();
  }
}
