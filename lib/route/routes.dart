import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 📌 스크린 임포트
import 'package:anbd/screens/home/home_screen.dart';
import 'package:anbd/screens/onboarding/onboarding_screen.dart';
import 'package:anbd/screens/detail/detail_screen.dart';
import 'package:anbd/screens/loading/loading_screen.dart';

class AppRouter {
  static late GoRouter router;

  static Future<void> setupRouter() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;
    final String initialLocation = isOnboardingCompleted ? '/home' : '/onboarding';

    router = GoRouter(
      initialLocation: initialLocation, // ✅ 비동기적으로 초기 라우트 설정
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/detail/:id', // ✅ 제품 ID를 전달할 수 있도록 설정
          builder: (context, state) {
          final String id = state.pathParameters['id'] ?? '0';
          return DetailScreen(productId: id);
          }
        ),
        GoRoute(
          path: '/loading',
          builder: (context, state) => const LoadingScreen(),
        ),
      ],
    );
  }
}
