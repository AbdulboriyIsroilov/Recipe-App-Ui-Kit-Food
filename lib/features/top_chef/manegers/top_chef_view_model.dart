import 'package:flutter/material.dart';

import '../../../data/models/home_model/top_chef_model.dart';
import '../../../data/repositores/top_chefs_repository/top_chefs_repostory.dart';

class TopChefViewModel extends ChangeNotifier {
  TopChefViewModel({
    required TopChefsRepostory topChetOneRepo,
    required TopChefsRepostory topChetTwoRepo,
    required TopChefsRepostory topChetThreeRepo,
  }) : _topChefOneRepo = topChetOneRepo,
       _topChefTwoRepo = topChetTwoRepo,
       _topChefThreeRepo = topChetThreeRepo;

  final TopChefsRepostory _topChefOneRepo, _topChefTwoRepo, _topChefThreeRepo;
  String? topChefOneError, topChefTwoError, topChefThreeError;
  bool topChefLoading = true;
  List<TopChefModel> topChefOne = [];

  Future<void> fetchTopChefOne({required int limit, required int page}) async {
    topChefLoading = true;
    notifyListeners();

    try {
      topChefOne = await _topChefOneRepo.getTopChef(limit: limit, page: page);
    } catch (exception) {
      topChefOneError = exception.toString();
    }

    topChefLoading = false;
    notifyListeners();
  }

  List<TopChefModel> topChefTwo = [];

  Future<void> fetchTopChefTwo({required int limit, required int page}) async {
    topChefLoading = true;
    notifyListeners();

    try {
      topChefTwo = await _topChefTwoRepo.getTopChef(limit: limit, page: page);
    } catch (exception) {
      topChefTwoError = exception.toString();
    }

    topChefLoading = false;
    notifyListeners();
  }

  List<TopChefModel> topChefThree = [];

  Future<void> fetchTopChefThree({
    required int limit,
    required int page,
  }) async {
    topChefLoading = true;
    notifyListeners();

    try {
      topChefThree = await _topChefThreeRepo.getTopChef(
        limit: limit,
        page: page,
      );
    } catch (exception) {
      topChefThreeError = exception.toString();
    }

    topChefLoading = false;
    notifyListeners();
  }
}
