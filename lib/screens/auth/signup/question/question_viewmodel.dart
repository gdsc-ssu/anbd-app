import 'dart:developer';

import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:flutter/material.dart';

class QuestionViewModel extends ChangeNotifier {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();

  String? _selectedGender; // 선택된 성별
  DateTime? _selectedDate; // 선택된 날짜(출생일 등)

  /// 비동기 로드를 통해 받아온 name
  String? _name;
  String? get name => _name;

  /// UI에 표시할 텍스트 필드 컨트롤러
  final TextEditingController ageController = TextEditingController();

  QuestionViewModel() {
    // name을 비동기적으로 로드
    _loadName();
    // ageController의 변경에도 notifyListeners() 호출
    ageController.addListener(() {
      notifyListeners();
    });
  }

  Future<void> _loadName() async {
    // 예를 들어, readAccessToken()이 Future<String>를 반환한다고 가정합니다.
    _name = await _secureStorage.readUserName();
    notifyListeners();
  }
  String? get selectedGender => _selectedGender;

  void setGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  bool get isNextButtonVisible => ageController.text.isNotEmpty; // 버튼 표시 여부

  @override
  void dispose() {
    ageController.dispose();
    super.dispose();
  }
}
