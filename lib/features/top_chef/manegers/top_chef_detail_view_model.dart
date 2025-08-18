import 'package:flutter/cupertino.dart';
import 'package:recipe_app_ui_kit_food/data/models/top_chef_detail_model/top_chef_detail_model.dart';

import '../../../data/repositores/top_chefs_repository/top_chef_detail_reposty.dart';

class TopChefDetailViewModel extends ChangeNotifier {
  TopChefDetailViewModel({required TopChefDetailRepostory repository,required int id})
      : _repository = repository{
    fetchTopChefDetail(id);
  }

  final TopChefDetailRepostory _repository;

  TopChefDetailModel chefDetail = TopChefDetailModel.empty();
  bool loading = false;
  String? errorMessage;

  Future<void> fetchTopChefDetail(int id) async {
    loading = true;
    errorMessage = null;
    notifyListeners();

    try {
      chefDetail = await _repository.getTopChefDetail(id);
    } catch (e) {
      errorMessage = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}


