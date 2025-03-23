import 'dart:developer';

import 'package:anbd/constants/constants.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:anbd/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

String baseSvgPicture = 'assets/svg/category/';

/// 카테고리 아이템 모델
class CategoryItem {
  final SvgPicture icon;
  final String label;
  final String categoryKey;

  CategoryItem({
    required this.label,
    required this.categoryKey,
    required this.icon,
  });
}

class CategoryViewModel extends ChangeNotifier {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();
  final UserService userService = GetIt.instance<UserService>();

  String? _name;
  String? get name => _name;

  String? _gender;
  String? get gender => _gender;

  String? _birthDate;
  String? get birthDate => _birthDate;

  String? _neighborhood;
  String? get neighborhood => _neighborhood;

  /// 선택한 카테고리 저장 리스트
  final Set<String> _selectedCategoryKeys = {};
  Set<String> get selectedCategoryKeys => _selectedCategoryKeys;

  Future<void> _loadStoreRepository() async {
    _name = await _secureStorage.readUserName();
    _gender = await _secureStorage.readUserGender();
    _birthDate = await _secureStorage.readUserBirthDate();
    _neighborhood = await _secureStorage.readUserNearbyDistricts();
    notifyListeners();
  }

  CategoryViewModel() {
    Future.microtask(() => _loadStoreRepository());
  }

  /// 카테고리 선택 토글
  void toggleCategory(String categoryKey) {
    if (_selectedCategoryKeys.contains(categoryKey)) {
      _selectedCategoryKeys.remove(categoryKey);
    } else {
      _selectedCategoryKeys.add(categoryKey);
    }
    notifyListeners();
  }

  /// 선택 완료 시 다음 화면으로 이동
  void selectCategoryComplete(BuildContext context) async {
    await userService.putUsersProfiles(
        gender, birthDate, neighborhood, selectedCategoryKeys);

    log("$selectedCategoryKeys");
    context.push(Paths.home);
  }

  /// 카테고리 목록
  final List<CategoryItem> categories = [
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}food.svg'),
        label: "음식",
        categoryKey: "food"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}digital.svg'),
        label: "디지털 기기",
        categoryKey: "digital"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}home_appliance.svg'),
        label: "생활/가전",
        categoryKey: "home_appliance"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}furniture_interior.svg'),
        label: "가구/인테리어",
        categoryKey: "furniture_interior"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}woman_accessory.svg'),
        label: "여성잡화",
        categoryKey: "woman_accessory"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}man_fashion.svg'),
        label: "남성패션/잡화",
        categoryKey: "man_fashion"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}living_kitchen.svg'),
        label: "생활/주방",
        categoryKey: "living_kitchen"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}sport_leisure.svg'),
        label: "스포츠/레저",
        categoryKey: "sport_leisure"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}hobby_game_music.svg'),
        label: "취미/게임/음반",
        categoryKey: "hobby_game_music"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}beauty_cosmetic.svg'),
        label: "뷰티/미용",
        categoryKey: "beauty_cosmetic"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}plant.svg'),
        label: "식물",
        categoryKey: "plant"),
    CategoryItem(
        icon: SvgPicture.asset('${baseSvgPicture}book.svg'),
        label: "도서",
        categoryKey: "book"),
  ];
}
