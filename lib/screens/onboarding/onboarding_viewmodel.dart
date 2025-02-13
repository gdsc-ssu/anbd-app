import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:andb/models/onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  PageController get pageController => _pageController;
  int get currentPage => _currentPage;
  List<OnboardingInfo> get onboardingItems => OnboardingItems.items;

  void updatePage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < onboardingItems.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingCompleted', true);

    // ✅ 온보딩 완료 후 홈 화면으로 이동
    Navigator.pushReplacementNamed(context, "/home");
  }

  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isOnboardingCompleted') ?? false;
  }
}
