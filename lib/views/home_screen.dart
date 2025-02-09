import 'package:flutter/material.dart';
import 'package:andb/widgets/custom_bottom_navigation_bar.dart'; // ✅ import 추가

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // 현재 선택된 탭 인덱스

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("상도동")),
      body: _buildBody(), // ✅ 현재 선택된 탭에 따라 화면 변경
      bottomNavigationBar: CustomBottomNavigationBar( // ✅ 분리한 위젯 사용
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 탭 변경
          });
        },
      ),
    );
  }

  /// ✅ 현재 선택된 탭에 따라 화면을 반환하는 함수
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return Center(child: Text("홈 화면"));
      case 1:
        return Center(child: Text("동네 생활"));
      case 2:
        return Center(child: Text("채팅"));
      default:
        return Center(child: Text("마이페이지"));
    }
  }
}
