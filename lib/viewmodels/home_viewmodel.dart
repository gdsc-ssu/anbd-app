import 'package:flutter/material.dart';
import 'package:andb/models/product_model.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends ChangeNotifier {
  // List<Product> products = [];
  // String currentLocation = "ara";

  // final Map<String, String> locationTypeToString = {
  //   "ara": "아라동",
  //   "ora": "오라동",
  //   "donam": "도남동"
  // };
  //
  // final oCcy = NumberFormat("#,###", "ko_KR");
  //
  // HomeViewModel() {
  //   loadProducts();
  // }
  //
  // void loadProducts() {
  //   products = [
  //     Product(image: "assets/images/ara-1.jpg", title: "네메시스 축구 275", location: "제주 제주시 아라동", price: "30000", likes: "2"),
  //     Product(image: "assets/images/ara-2.jpg", title: "네메시스 축구 275", location: "제주 제주시 아라동", price: "30000", likes: "2"),
  //     Product(image: "assets/images/ara-3.jpg", title: "네메시스 축구 275", location: "제주 제주시 아라동", price: "30000", likes: "2"),
  //     Product(image: "assets/images/ara-4.jpg", title: "네메시스 축구 275", location: "제주 제주시 아라동", price: "30000", likes: "2"),
  //   ];
  //   notifyListeners(); // 데이터 변경 감지 후 UI 업데이트
  // }
  //
  // void changeLocation(String newLocation) {
  //   currentLocation = newLocation;
  //   notifyListeners();
  // }
  //
  // String calcStringToWon(String price) {
  //   return "${oCcy.format(int.parse(price))}원";
  // }
}
