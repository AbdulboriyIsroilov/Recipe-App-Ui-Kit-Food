import '../../../core/client.dart';
import '../../models/on_boarding_model/onboarding_model.dart';

class OnBoardingRepository {
  List<OnboardingModel> onBoarding = [];

  Future<List<OnboardingModel>> getAll() async {
    if (onBoarding.isNotEmpty) return onBoarding;

    var response = await dio.get("/onboarding/list");

    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    onBoarding = (response.data as List)
        .map((item) => OnboardingModel.fromJson(item))
        .toList();
    return onBoarding;
  }
}
