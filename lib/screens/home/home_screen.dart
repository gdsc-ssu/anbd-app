import 'package:anbd/screens/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:anbd/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

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
            body: viewModel.currentScreen, // ✅ 홈 화면에서 ProductItem 리스트 표시
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: viewModel.updateIndex,
            ),
          );
        },
      ),
    );
  }
}
