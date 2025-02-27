import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:andb/screens/home/home_screen.dart';
import 'package:andb/screens/onboarding/onboarding_screen.dart';

class AppRouter {
  static Future<String> get initialRoute async {
    final prefs = await SharedPreferences.getInstance();
    final bool isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;
    return isOnboardingCompleted ? '/home' : '/onboarding';
  }

  static final GoRouter router = GoRouter(
    initialLocation: '/onboarding', // ✅ 경로를 직접 사용
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
