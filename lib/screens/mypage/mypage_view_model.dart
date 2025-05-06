import 'dart:developer';

import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:anbd/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyPageViewModel extends ChangeNotifier {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();
  final UserService userService = GetIt.instance<UserService>();

  String _currentLocation = '마이페이지'; // 기본 위치 이름
  String get currentLocation => _currentLocation;

  String? imageUrl;
  String? name;

  MyPageViewModel() {
    fetchUserInfo();
  }

  void updateLocation(String newLocation) {
    _currentLocation = newLocation;
    notifyListeners();
  }

  Future<void> fetchUserInfo() async {
    final response = await userService.getUsersProfiles();
    imageUrl = response.profileImage;
    name = response.nickname;
    log("이름 $name");
    notifyListeners();
  }

  Future<void> logOut() async {
    _secureStorage.deleteAllData();
  }

  Future<void> signOut(BuildContext context) async {
    await userService.signOut();
    await _secureStorage.deleteAllData();
  }
}
