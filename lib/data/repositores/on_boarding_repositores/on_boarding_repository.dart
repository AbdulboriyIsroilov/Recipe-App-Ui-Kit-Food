import '../../../core/dio_core.dart';
import '../../models/on_boarding_model/onboarding_model.dart';

class OnBoardingRepository {
  List<OnboardingModel> onBoarding = [];

  Future<List<OnboardingModel>> getAll() async {
    if (onBoarding.isNotEmpty) return onBoarding;

    var reseponse = await dio.get("/onboarding/list");

    if (reseponse.statusCode != 200) {
      throw Exception(reseponse.data);
    }
    onBoarding = (reseponse.data as List)
        .map((item) => OnboardingModel.fromJson(item))
        .toList();
    return onBoarding;
  }
}
