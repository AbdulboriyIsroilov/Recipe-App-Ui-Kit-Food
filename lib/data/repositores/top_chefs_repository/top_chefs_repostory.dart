import '../../../core/client.dart';
import '../../models/home_model/top_chef_model.dart';

class TopChefsRepostory {
  List<TopChefModel> topChef = [];

  Future<List<TopChefModel>> getTopChef({
    required int limit,
    required int page,
  }) async {

    var response = await dio.get("/top-chefs/list?Page=$page&Limit=$limit");
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    topChef = (response.data as List)
        .map((item) => TopChefModel.fromJson(item))
        .toList();
    return topChef;
  }
}
