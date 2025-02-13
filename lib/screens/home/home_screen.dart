import 'package:andb/screens/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:andb/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart'; // ✅ import 추가

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: const Text("상도동")),
            body: viewModel.currentScreen, // ✅ ViewModel에서 직접 가져옴
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: viewModel.updateIndex, // ✅ ViewModel의 onTap 메서드 사용
            ),
          );
        },
      ),
    );
  }
}
