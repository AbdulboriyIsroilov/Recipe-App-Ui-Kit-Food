import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../models/reviews_model/reviews_comment_model.dart';

class ReviewsRepository {
  ReviewsRepository({
    required ApiClient client,
    required FlutterSecureStorage secureStorage,
  }) : _client = client,
        _secureStorage = secureStorage;

  final ApiClient _client;
  final FlutterSecureStorage _secureStorage;

  Future<Result<List<ReviewsCommentModel>>> getReviews({required int categoryId}) async {
    var response = await _client.get<List>("/reviews/list?recipeId=$categoryId");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(val.map((item) => ReviewsCommentModel.fromJson(item)).toList()),
    );
  }

  Future<Result<dynamic>> getAddReviews(Map<String, dynamic> data) async {
    var response = await _client.post("/reviews/create", data: data);
    return response.fold(
      (error) => Result.error(error),
      (val) {
        // _secureStorage.write(key: "token", value: val["accessToken"]);
        return Result.ok(val["accessToken"]);
      },
    );
  }
}
