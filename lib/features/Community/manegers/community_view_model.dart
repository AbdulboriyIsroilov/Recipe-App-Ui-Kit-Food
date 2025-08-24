import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/community_model/community_model.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipe_repository/community_repository.dart';

class CommunityViewModel extends ChangeNotifier {
  CommunityViewModel({required CommunityRepository communityRepo}) : _communityRepo = communityRepo {
    fetchCommunityTop();
    fetchCommunityNew();
    fetchCommunityOld();
  }

  final CommunityRepository _communityRepo;

  List<CommunityModel> communityTop = [], communityNew = [], communityOld = [];
  bool loadingTop = true, loadingNew = true, loadingOld = true;
  String? error;

  Future<void> fetchCommunityTop() async {
    loadingTop = true;
    notifyListeners();
    var result = await _communityRepo.getAll({"Limit": 11});

    result.fold(
      (err) {
        error = err.toString();
      },
      (value) {
        communityTop = value;
      },
    );

    loadingTop = false;
    notifyListeners();
  }

  Future<void> fetchCommunityNew() async {
    loadingNew = true;
    notifyListeners();
    var result = await _communityRepo.getAll({
      "Limit": 10,
      "Order": "Rating",
      "Descending": "true",
    });

    result.fold(
      (err) {
        error = err.toString();
      },
      (value) {
        communityNew = value;
      },
    );

    loadingNew = false;
    notifyListeners();
  }

  Future<void> fetchCommunityOld() async {
    loadingOld = true;
    notifyListeners();
    var result = await _communityRepo.getAll({
      "Limit": 12,
      "Order": "Rating",
      "Descending": "false",
    });

    result.fold(
      (err) {
        error = err.toString();
      },
      (value) {
        communityOld = value;
      },
    );

    loadingOld = false;
    notifyListeners();
  }

  String datas(DateTime created) {
    DateTime now = DateTime.now();
    Duration time = now.difference(created);
    var data = time.inDays;
    if (data >= 365) {
      int years = (data ~/ 365);
      return "$years years ago";
    }else if (data < 365){
      int month = (data ~/ 30);
      return "$month month ago";
    }else if (data < 30){
      int week = (data ~/ 7);
      return "$week week ago";
    }else{
      return "$data days ago";
    }
  }
}
