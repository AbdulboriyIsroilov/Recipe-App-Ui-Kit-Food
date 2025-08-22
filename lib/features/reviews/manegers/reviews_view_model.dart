import 'package:flutter/material.dart';

import '../../../core/client.dart';
import '../../../data/models/reviews_model/reviews_model.dart';

class ReviewsViewModel extends ChangeNotifier{
  ReviewsViewModel({required int categoryId}){
    fetchReviewDetail(categoryId: categoryId);
  }
  late ReviewsModel review;
  bool loading = true;

  Future<void> fetchReviewDetail({required int categoryId}) async{
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/reviews/detail/$categoryId");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    review = ReviewsModel.fromJson(reseponse.data as Map<String, dynamic>);
    loading = false;
    notifyListeners();
  }
}