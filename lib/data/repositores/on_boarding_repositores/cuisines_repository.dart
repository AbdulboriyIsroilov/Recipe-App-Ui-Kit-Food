import '../../../core/dio_core.dart';
import '../../models/on_boarding_model/cuisine_model.dart';

class CuisinesRepository {
  List<CuisineModel> cuisine = [];

  Future<List<CuisineModel>> getAll() async {
    if (cuisine.isNotEmpty) return cuisine;

    final response = await dio.get("/cuisines/list");

    if (response.statusCode != 200) {
      throw Exception(response.data);
    } else {
      cuisine = (response.data as List)
          .map((item) => CuisineModel.fromJson(item))
          .toList();
      return cuisine;
    }
  }
}
