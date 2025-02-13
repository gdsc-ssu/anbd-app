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

  Future<void> completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingCompleted', true);
    Navigator.pushReplacementNamed(context, "/home");
  }
}
