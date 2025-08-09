import '../../../core/dio_core.dart';
import '../../models/on_boarding_model/allergic_model.dart';

class AllergicRepository {
  List<AllergicModel> categories = [];

  Future<List<AllergicModel>> getAll() async {
    if (categories.isNotEmpty) return categories;

    final response = await dio.get("/allergic/list");

    if (response.statusCode != 200) {
      throw Exception(response.data);
    } else {
      categories = (response.data as List)
          .map((item) => AllergicModel.fromJson(item))
          .toList();
      return categories;
    }
  }
}
