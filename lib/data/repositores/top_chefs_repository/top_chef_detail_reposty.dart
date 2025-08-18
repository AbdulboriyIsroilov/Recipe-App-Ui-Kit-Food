import 'package:recipe_app_ui_kit_food/data/models/top_chef_detail_model/top_chef_detail_model.dart';

import '../../../core/dio_core.dart';

class TopChefDetailRepostory {
  TopChefDetailModel? topChefDetail;

  Future<TopChefDetailModel> getTopChefDetail(int id) async {
    if (topChefDetail != null && topChefDetail!.id == id) {
      return topChefDetail!;
    }

    var response = await dio.get("/auth/details/$id");
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }

    topChefDetail = TopChefDetailModel.fromJson(response.data);
    return topChefDetail!;
  }
}


