import 'package:flutter/material.dart';

import '../../../core/dio_core.dart';
import '../../../data/models/reviews_model/reviews_add_model.dart';

class ReviewsAddViewModel extends ChangeNotifier{
  ReviewsAddViewModel({required int categoryId}){
    fetchReviewCommentAdd(categoryId: categoryId);
  }
  late ReviewsAddModel commentsAdd;
  bool loading = true;

  Future<void> fetchReviewCommentAdd({required int categoryId}) async{
    loading = true;
    notifyListeners();
    var reseponse = await dio.get("/recipes/create-review/$categoryId");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    commentsAdd = ReviewsAddModel.fromJson(reseponse.data as Map<String,dynamic>);
    loading = false;
    notifyListeners();
  }
}
