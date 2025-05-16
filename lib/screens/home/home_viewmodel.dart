import 'dart:developer';

import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:anbd/screens/community/community_screen.dart';
import 'package:anbd/screens/chat/chat_screen.dart';
import 'package:anbd/screens/mypage/mypage_screen.dart';
import 'package:anbd/widgets/product_item.dart';
import 'package:anbd/data/service/share_post_service.dart'; // ✅ 이걸 사용합니다.
import 'package:anbd/data/dto/response/share_all_post_response.dart';

class HomeViewModel extends ChangeNotifier {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();

  int _currentIndex = 0;
  bool isLoading = true;
  List<SharePostResponse> _products = [];

  String _currentLocation = '';

  final SharePostService _service;

  HomeViewModel() : _service = SharePostService() {
    print("🚀 HomeViewModel 초기화됨");
    fetchProducts();
  }

  Future<void> init() async {
    _currentLocation = await _secureStorage.readUserNearbyDistricts() as String;
    log('저장 장소 $_currentLocation');
    await fetchProducts();
    notifyListeners();
  }

  List<SharePostResponse> get products => _products;
  int get currentIndex => _currentIndex;
  String get currentLocation => _currentLocation;

  String get currentAppBarTitle {
    return _currentIndex == 0 ? _currentLocation : _appBarTitles[_currentIndex];
  }

  // final List<String> _appBarTitles = ["홈", "동네생활", "채팅", "마이페이지"];
  final List<String> _appBarTitles = ["홈", "채팅", "마이페이지"];

  void updateIndex(int index) {
    _currentIndex = index;
    print("🧭 현재 index: $_currentIndex");
    print("현재 위치 : $_currentLocation");
    notifyListeners();
  }

  void updateLocation(String newLocation) {
    _currentLocation = newLocation;
    print("📍 위치 변경: $_currentLocation");
    fetchProducts(); // 위치 바뀌면 다시 fetch
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    print("📦 데이터 불러오는 중... location=$_currentLocation");

    try {
      print("📥 서버 호출 시작");
      ShareAllPostResponse response = await _service.fetchAllPosts(
        page: 0,
        size: 10,
        location: _currentLocation,
      );

      print("📥 서버 응답 성공");
      print("🧱 content raw: ${response.content}");

      _products = response.content
          .map((post) {
            print("🧱 게시글 title: ${post.title} (${post.id})");
            return post;
          })
          .cast<SharePostResponse>()
          .toList();
    } catch (e, stack) {
      print("❌ 에러 발생: $e");
      print("📛 스택 트레이스:\n$stack");
      _products = [];
    }

    isLoading = false;
    notifyListeners();
    print("🎯 상태 갱신 완료. 총 아이템 수: ${_products.length}");
  }

  Widget get currentScreen {
    if (_currentIndex == 0) {
      print("🖥️ 홈 화면 렌더링 중...");
      return _buildHomeScreen();
    } else {
      return _screens[_currentIndex - 1];
    }
  }

  Future<void> refresh() async {
    // 예: API 호출해서 데이터 새로고침
    await fetchProducts(); // 메서드 이름은 실제 프로젝트에 맞게!
    notifyListeners();
  }

  Widget _buildHomeScreen() {
    if (isLoading) {
      print("⏳ 로딩 중...");
      return const Center(child: CircularProgressIndicator());
    }

    if (_products.isEmpty) {
      print("⚠️ 제품 목록이 비어있습니다.");
      return const Center(child: Text("등록된 게시글이 없습니다."));
    }

    print("🧩 제품 리스트 렌더링 시작 (개수: ${_products.length})");
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return ProductItem(product: _products[index]);
      },
    );
  }

  final List<Widget> _screens = [
    // const CommunityScreen(),
    const ChatScreen(),
    const MyPageScreen(),
  ];
}
