import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anbd/screens/onboarding/onboarding_viewmodel.dart';
import 'package:anbd/screens/home/home_viewmodel.dart';
import 'package:anbd/screens/detail/detail_viewmodel.dart';
import 'package:anbd/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ 비동기 실행을 위해 필요
  await AppRouter.setupRouter(); // ✅ 라우터 설정 (SharedPreferences 조회 후 결정)

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()), // ✅ 온보딩 관련 ViewModel
        ChangeNotifierProvider(create: (_) => HomeViewModel()), // ✅ 홈 화면 관련 ViewModel 추가
        ChangeNotifierProvider(create: (_) => DetailViewModel()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Onboarding',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(),
        ),
        routerConfig: AppRouter.router, // ✅ GoRouter 적용
      ),
    );
  }
}
