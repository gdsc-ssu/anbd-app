import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/onboarding/onboarding_viewmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:anbd/models/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OnboardingViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: viewModel.currentPage == viewModel.onboardingItems.length - 1
          ? null
          : OnboardingAppBar(
              onSkip: () => viewModel.completeOnboarding(context)),
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
              ? _buildStartButton(viewModel, context)
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
            activeDotColor: AnbdColor.blue,
            dotColor: AnbdColor.systemGray02,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                children: item.contentSpans, style: AnbdTextStyle.TitleSB18),
          ),
          const SizedBox(height: 8),
          Image.asset(
            item.image,
            height: 250,
          ),
          index != 4 ? const SizedBox(height: 60) : const SizedBox(height: 0),
        ],
      ),
    );
  }

  Widget _buildStartButton(
      OnboardingViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: ElevatedButton(
        onPressed: () => viewModel.completeOnboarding(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AnbdColor.blue,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          "ANBD 시작하기",
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'PretendardSemiBold',
              color: Colors.white),
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
            onPressed: () {
              context.push(Paths.home);
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                fontSize: 15,
                fontFamily: "PretendardSemiBold",
                color: AnbdColor.systemGray03,
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
