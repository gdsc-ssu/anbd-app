import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:andb/screens/onboarding/onboarding_screen.dart';
import 'package:andb/screens/home/home_screen.dart';
import 'package:andb/screens/onboarding/onboarding_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;

  runApp(MyApp(isOnboardingCompleted: isOnboardingCompleted));
}

class MyApp extends StatelessWidget {
  final bool isOnboardingCompleted;

  const MyApp({super.key, required this.isOnboardingCompleted});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, // 전체 앱 배경색을 흰색으로 설정
          colorScheme: ColorScheme.light(), // 기본 색상을 라이트 모드로 설정
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Onboarding',
        // initialRoute: isOnboardingCompleted ? "/home" : "/onboarding",
        initialRoute: "/onboarding",
        routes: {
          "/onboarding": (context) => const OnboardingScreen(),
          "/home": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
