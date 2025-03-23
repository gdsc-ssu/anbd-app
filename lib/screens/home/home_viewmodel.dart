import 'package:flutter/material.dart';
import 'package:anbd/screens/community/community_screen.dart';
import 'package:anbd/screens/chat/chat_screen.dart';
import 'package:anbd/screens/mypage/mypage_screen.dart';
import 'package:anbd/models/product_model.dart';
import 'package:anbd/widgets/product_item.dart';
import 'package:anbd/data/service/share_all_post_service.dart'; // ✅ 이걸 사용합니다.
import 'package:anbd/data/dto/response/share_all_post_response.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  bool isLoading = true;
  List<Product> _products = [];

  String _currentLocation = "서울";
  final List<String> _locations = ["군자동", "광진구 구의제3동", "동대문구 휘경동"];

  final ShareAllPostService _service;

  HomeViewModel({required String masterToken})
    : _service = ShareAllPostService(token: masterToken) {
    fetchProducts();
  }

  List<Product> get products => _products;
  int get currentIndex => _currentIndex;
  String get currentLocation => _currentLocation;
  List<String> get locations => _locations;

  String get currentAppBarTitle {
    return _currentIndex == 0 ? _currentLocation : _appBarTitles[_currentIndex];
  }

  final List<String> _appBarTitles = [
    "홈",
    "동네생활",
    "채팅",
    "마이페이지"
  ];

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updateLocation(String newLocation) {
    _currentLocation = newLocation;
    notifyListeners();
  }

  // ✅ 실제 목록 API로부터 데이터를 가져오는 최종 구현
  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      ShareAllPostResponse response = await _service.fetchPosts(page: 0, size: 5, location: _currentLocation);
      print("✅ API 응답 content 길이: ${response.content.length}");
      _products = response.content.map((post) => Product.fromJson(post.toJson())).toList();

    } catch (e) {
      print("에러 발생: $e");
      _products = [];
    }

    isLoading = false;
    notifyListeners();
  }

  Widget get currentScreen {
    if (_currentIndex == 0) {
      return _buildHomeScreen();
    } else {
      return _screens[_currentIndex - 1];
    }
  }

  Widget _buildHomeScreen() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return ProductItem(product: _products[index]);
      },
    );
  }

  final List<Widget> _screens = [
    const CommunityScreen(),
    const ChatScreen(),
    const MyPageScreen(),
  ];
}
