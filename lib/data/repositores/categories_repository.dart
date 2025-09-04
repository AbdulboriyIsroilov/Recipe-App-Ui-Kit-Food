import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../models/category_models/category_model.dart';

class CategoriesRepository {
  CategoriesRepository({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<Result<List<CategoryModel>>> getCategory() async {
    var response = await _client.get<List>("/categories/list");
    return response.fold(
      ((error) => Result.error(error)),
      (onSuccess) => Result.ok(
        onSuccess.map((item) => CategoryModel.fromJson(item)).toList(),
      ),
    );
  }
}
