import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // ✅ UI 업데이트
  }

  Widget get currentScreen {
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