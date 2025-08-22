import 'package:flutter/material.dart';

import '../../../core/client.dart';
import '../../../data/models/reviews_model/reviews_comment_model.dart';

class ReviewsCommentViewModel extends ChangeNotifier{
  ReviewsCommentViewModel({required int categoryId}){
    fetchReviewDetailComment(categoryId: categoryId);
  }
  List<ReviewsCommentModel> comments = [];
  bool loading = true;

  Future<void> fetchReviewDetailComment({required int categoryId}) async{
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/reviews/list?recipeId=$categoryId");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    comments = (reseponse.data as List)
        .map((item) => ReviewsCommentModel.fromJson(item))
        .toList();
    loading = false;
    notifyListeners();
  }
}