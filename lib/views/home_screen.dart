import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import 'package:anbd_app/viewmodels/home_viewmodel.dart';

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
      body: _buildBody(), // ✅ 화면 변경을 위한 함수 호출
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 탭 변경
          });
        },
        items: [
          _bottomNavigationBarItem("home", "홈"),
          _bottomNavigationBarItem("notes", "동네생활"),
          _bottomNavigationBarItem("chat", "채팅"),
          _bottomNavigationBarItem("user", "마이페이지"),
        ],
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

  /// ✅ BottomNavigationBarItem을 쉽게 추가하는 함수
  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset("assets/svg/${iconName}_off.svg", width: 24),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset("assets/svg/${iconName}_on.svg", width: 24),
      ),
      label: label,
    );
  }
}
