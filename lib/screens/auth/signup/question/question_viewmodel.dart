import 'dart:developer';

import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuestionViewModel extends ChangeNotifier {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();

  /// 비동기 로드를 통해 받아온 name
  String? _name;
  String? get name => _name;

  /// UI에 표시할 텍스트 필드 컨트롤러
  final TextEditingController ageController = TextEditingController();

  QuestionViewModel() {
    _loadName();
    ageController.addListener(() {
      notifyListeners();
    });
  }

  Future<void> _loadName() async {
    _name = await _secureStorage.readUserName();
    notifyListeners();
  }

  /// 성별 Getter
  String? _selectedGender;
  String? get selectedGender => _selectedGender;

  /// 날짜 Getter
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  /// '다음' 버튼 표시 여부 (성별과 날짜 모두 선택해야 true)
  bool get isNextButtonVisible =>
      _selectedGender != null && _selectedDate != null;

  /// 성별 설정
  void setGender(String gender) {
    _selectedGender = gender;

    notifyListeners();
  }

  /// 날짜 설정 + TextField 업데이트
  void setDate(DateTime date) {
    _selectedDate = date;
    final dateString = DateFormat('yyyy-MM-dd').format(date);
    ageController.text = dateString;
    notifyListeners();
  }

  Future<void> saveUserInfo(
      String? selectedGender, String? selectedDate) async {
    if (selectedGender == '남성') {
      selectedGender = 'MALE';
    } else {
      selectedGender = 'FEMALE';
    }

    log("성별 : $selectedGender, 생일 : $selectedDate");
    _secureStorage.saveUserGender(selectedGender);
    _secureStorage.saveUserBirthDate(selectedDate!);
  }

  @override
  void dispose() {
    ageController.dispose();
    super.dispose();
  }
}
