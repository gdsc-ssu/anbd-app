import 'package:anbd/screens/auth/login/login_screen.dart';
import 'package:anbd/screens/auth/signup/question/question_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:anbd/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anbd/screens/home/home_screen.dart';
import 'package:anbd/screens/onboarding/onboarding_screen.dart';

class AppRouter {
  static Future<String> get initialRoute async {
    final prefs = await SharedPreferences.getInstance();
    final bool isOnboardingCompleted =
        prefs.getBool('isOnboardingCompleted') ?? false;
    return isOnboardingCompleted ? '/home' : '/onboarding';
  }

  static final GoRouter router = GoRouter(
    initialLocation: Paths.login, // ✅ 경로를 직접 사용
    routes: [
      GoRoute(
        path: Paths.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Paths.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Paths.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Paths.signupProcess,
        builder: (context, state) => QuestionScreen(),
      ),
    ],
  );
}
