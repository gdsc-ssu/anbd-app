import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:andb/screens/onboarding/onboarding_viewmodel.dart';
import 'package:andb/screens/onboarding/onboarding_view.dart';
import 'package:andb/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
      ],
      child: MyApp(startScreen: isOnboardingCompleted ? const HomeScreen() : const OnboardingScreen()),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  const MyApp({super.key, required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: startScreen, // ✅ 온보딩 완료 여부에 따라 시작 화면 설정
    );
  }
}
