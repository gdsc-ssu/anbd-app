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
                const SizedBox(height: 80),
                _buildPageIndicator(viewModel),
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

  Widget _buildPageIndicator(OnboardingViewModel viewModel) {
    return Align( // ✅ 중앙 정렬
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SmoothPageIndicator(
          controller: viewModel.pageController,
          count: viewModel.onboardingItems.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: const Color(0xFF1E88E5),
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingInfo item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.content,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Image.asset(item.image, height: 250),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(OnboardingViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ElevatedButton(
        onPressed: () => viewModel.completeOnboarding(context), // 온보딩 완료 처리
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E88E5),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text("Skip", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
