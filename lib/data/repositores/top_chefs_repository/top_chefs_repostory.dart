import '../../../core/dio_core.dart';
import '../../models/home_model/top_chef_model.dart';

class TopChefsRepostory {
  List<TopChefModel> topChef = [];

  Future<List<TopChefModel>> getTopChef({
    required int limit,
    required int page,
  }) async {
    if (topChef.isNotEmpty) return topChef;

    var reseponse = await dio.get("/top-chefs/list?Page=$page&Limit=$limit");
    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    topChef = (reseponse.data as List)
        .map((item) => TopChefModel.fromJson(item))
        .toList();
    return topChef;
  }
}
