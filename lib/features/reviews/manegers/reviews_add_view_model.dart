import 'package:flutter/material.dart';

import '../../../data/models/reviews_model/reviews_add_model.dart';

class ReviewsAddViewModel extends ChangeNotifier{
  ReviewsAddViewModel({required int categoryId}){
  }
  late ReviewsAddModel commentsAdd;
  bool loading = true;

}
