import 'package:flutter/material.dart';

class MyPageViewModel extends ChangeNotifier {
  String _currentLocation = '마이페이지'; // 기본 위치 이름
  String get currentLocation => _currentLocation;

  void updateLocation(String newLocation) {
    _currentLocation = newLocation;
    notifyListeners();
  }
}
