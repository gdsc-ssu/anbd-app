import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:andb/screens/onboarding/onboarding_viewmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:andb/models/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OnboardingViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: viewModel.currentPage == viewModel.onboardingItems.length - 1
          ? null
          : OnboardingAppBar(onSkip: () => viewModel.completeOnboarding(context)),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: viewModel.pageController,
              itemCount: viewModel.onboardingItems.length,
              onPageChanged: viewModel.updatePage,
              itemBuilder: (context, index) {
                final item = viewModel.onboardingItems[index];
                return _buildOnboardingPage(item, index);
              },
            ),
          ),
          viewModel.currentPage == viewModel.onboardingItems.length - 1
              ? _buildStartButton(viewModel, context) // ✅ 마지막 페이지에서는 "ANDB 시작하기" 버튼 표시
              : _buildPageIndicator(viewModel),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(OnboardingViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SmoothPageIndicator(
          controller: viewModel.pageController,
          count: viewModel.onboardingItems.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: Color(0xFF1E88E5),
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingInfo item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Expanded( // ✅ Column을 Expanded로 감싸서 동일한 높이를 유지
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // ✅ 중앙 정렬 유지
          children: [
            Text(
              item.content,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.asset(
              item.image,
              height: 250,
            ),
            index != 4 ? const SizedBox(height: 60) : SizedBox(height: 0),
          ],
        ),
      ),
    );
  }


  Widget _buildStartButton(OnboardingViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: ElevatedButton(
        onPressed: () => viewModel.completeOnboarding(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E88E5),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          "ANDB 시작하기",
          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSkip;

  const OnboardingAppBar({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: TextButton(
            onPressed: onSkip,
            child: const Text(
              "Skip",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
