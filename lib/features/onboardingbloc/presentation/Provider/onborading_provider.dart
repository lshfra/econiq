import 'package:checker/features/onboardingbloc/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboradingProvider with ChangeNotifier {
  final List<OnboardingModel> _onboradingList = [
    OnboardingModel(title: "Selamat Datang Di Econique Tiken Scan", description: "")
  ];

  int _currentIndex = 0;
  OnboardingModel get currentOnborading => _onboradingList[_currentIndex];

  bool get isLastPage => _currentIndex == _onboradingList.length -1;

  void nextPage() {
    if (_currentIndex < _onboradingList.length - 1) {
      _currentIndex++;
      notifyListeners();
    } else {
      //navigasi ke halaman login atau halaman lainnya
      //navigator.pushReplacement(context, MaterialPageRoute(builder: (cotext) => LoginPage()));
    }
  }
}
