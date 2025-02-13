import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:andb/screens/onboarding/onboarding_viewmodel.dart';
import 'package:andb/models/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: viewModel.pageController,
                    itemCount: viewModel.onboardingItems.length,
                    onPageChanged: viewModel.updatePage,
                    itemBuilder: (context, index) {
                      final item = viewModel.onboardingItems[index];
                      return _buildOnboardingPage(item);
                    },
                  ),
                ),
                _buildBottomNavigation(viewModel, context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingInfo item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.image, height: 250),
          const SizedBox(height: 30),
          Text(
            item.content,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(OnboardingViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: viewModel.pageController,
            count: viewModel.onboardingItems.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => viewModel.completeOnboarding(context), // ✅ 온보딩 완료 처리
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Skip", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
