import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/onboarding/onboarding_viewmodel.dart';
import 'package:anbd/route/routes.dart'; // ✅ AppRouter import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ 초기 라우트를 동적으로 가져옴
  final String initialRoute = await AppRouter.initialRoute;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
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
