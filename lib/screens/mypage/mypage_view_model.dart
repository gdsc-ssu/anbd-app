import 'package:flutter/material.dart';

class MyPageViewModel extends ChangeNotifier {
  String _currentLocation = '마이페이지'; // 기본 위치 이름
  String get currentLocation => _currentLocation;

  String? imageUrl;

  MyPageViewModel() {
    fetchUserInfo();
  }

  void updateLocation(String newLocation) {
    _currentLocation = newLocation;
    notifyListeners();
  }

  void fetchUserInfo() {
    // 서버에서 유저 정보를 받아오는 로직이라고 가정
    imageUrl = 'https://your-image-url.com/profile.jpg'; // or null
    notifyListeners();
  }
}
