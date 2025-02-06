import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:andb/src/lib/viewmodels/home_viewmodel.dart';
import 'package:andb/src/lib/views/home_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: HomeScreen(), // ✅ MVVM 구조에 맞게 HomeScreen으로 변경
    );
  }
}
