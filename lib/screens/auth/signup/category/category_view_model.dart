import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

String baseSvgPicture = 'assets/svg/category/';

class CategoryViewModel extends ChangeNotifier {
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

  /// 카테고리를 선택하면 다음 화면으로 이동
  void selectCategory(String categoryKey, BuildContext context) {
    context.push(Paths.home);
  }
}

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
