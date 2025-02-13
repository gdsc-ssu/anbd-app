import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:andb/screens/home/home_viewmodel.dart';
import 'package:andb/screens/home/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()), // ✅ ViewModel 주입
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      title: 'Flutter MVVM Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black, // ✅ 기본 색상 지정
          brightness: Brightness.light, // ✅ 라이트 모드 적용
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(), // ✅ MVVM 구조에 맞게 HomeScreen으로 변경
    );
  }
}
