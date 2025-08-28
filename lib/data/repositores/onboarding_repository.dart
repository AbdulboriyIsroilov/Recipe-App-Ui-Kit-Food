import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

import '../../core/client.dart';
import '../models/onboarding_models/allergic_model.dart';
import '../models/onboarding_models/onboarding_model.dart';

class OnboardingRepository {
  OnboardingRepository({required ApiClient client}) : _client = client;

  final ApiClient _client;
  List<OnboardingModel> onBoarding = [];

  Future<Result<List<OnboardingModel>>> getOnboarding() async {
    var response = await _client.get<List>("/onboarding/list");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(val.map((item) => OnboardingModel.fromJson(item)).toList()),
    );
  }

  Future<Result<List<AllergicModel>>> getCuisine() async {
    final response = await _client.get<List>("/cuisines/list");
    return response.fold(
          (error) => Result.error(error),
          (val) => Result.ok(val.map((item) => AllergicModel.fromJson(item)).toList()),
    );
  }
  Future<Result<List<AllergicModel>>> getAllergic() async {

    final response = await _client.get("/allergic/list");
    return response.fold(
          (error) => Result.error(error),
          (val) => Result.ok(val.map((item) => AllergicModel.fromJson(item)).toList()),
    );

  }
}
