import 'package:flutter/material.dart';

class QuestionViewModel extends ChangeNotifier {
  String? _selectedGender; // 선택된 성별
  final TextEditingController ageController =
      TextEditingController(); // 나이 입력 컨트롤러

  QuestionViewModel() {
    ageController.addListener(() {
      notifyListeners(); // 입력 값 변경 시 UI 업데이트
    });
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
