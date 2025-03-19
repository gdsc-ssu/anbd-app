import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anbd/screens/onboarding/onboarding_viewmodel.dart';
import 'package:anbd/screens/home/home_viewmodel.dart';
import 'package:anbd/screens/detail/detail_viewmodel.dart';
import 'package:anbd/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ 비동기 실행을 위해 필요
  await AppRouter.setupRouter(); // ✅ 라우터 설정 (SharedPreferences 조회 후 결정)
  await FlutterConfig.loadEnvVariables(); // 환경 변수 로드

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
          scaffoldBackgroundColor: Colors.white, // 기본 배경색 흰색
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, // ✅ 앱의 기본 컬러를 흰색 또는 원하는 색상으로 변경
          ),
          useMaterial3: true, // Material3 사용
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent, // ✅ AppBar나 Surface 위젯의 보라색 tint 제거
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black), // 앱바 아이콘 색상 검정
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20), // 앱바 타이틀 색상
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // 버튼 기본색 검정으로 변경
              foregroundColor: Colors.white, // 버튼 텍스트 흰색
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black), // 아이콘 기본 검정색
        ),
        routerConfig: AppRouter.router, // ✅ GoRouter 적용
      ),
    );
  }
}
