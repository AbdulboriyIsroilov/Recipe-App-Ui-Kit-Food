import 'package:flutter/material.dart';

import '../../../data/models/on_boarding_model/onboarding_model.dart';
import '../../../data/repositores/on_boarding_repositores/on_boarding_repository.dart';

class OnBoardingViewModel extends ChangeNotifier {
  OnBoardingViewModel({
    required OnBoardingRepository onBoardingRepo,
  }) : _onBoardingRepo = onBoardingRepo;

  final OnBoardingRepository _onBoardingRepo;
  String? error;
  List<OnboardingModel> onBoarding = [];
  bool loading = true;

  Future<void> fetchOnBoarding() async {
    loading = true;
    notifyListeners();

    try {
      onBoarding = await _onBoardingRepo.getAll();
    } catch (exception) {
      error = exception.toString();
    }

    loading = false;
    notifyListeners();
  }
}
