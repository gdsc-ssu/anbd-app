import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:flutter/material.dart';
import 'package:anbd/screens/community/community_screen.dart';
import 'package:anbd/screens/chat/chat_screen.dart';
import 'package:anbd/screens/mypage/mypage_screen.dart';
import 'package:anbd/widgets/product_item.dart';
import 'package:anbd/data/service/share_post_service.dart'; // ✅ 이걸 사용합니다.
import 'package:anbd/data/dto/response/share_all_post_response.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  bool isLoading = true;
  List<SharePostResponse> _products = [];

  String _currentLocation = "서울";
  final List<String> _locations = ["군자동", "광진구 구의제3동", "동대문구 휘경동"];

  final SharePostService _service;

  HomeViewModel({required String masterToken})
      : _service = SharePostService(token: masterToken) {
    print("🚀 HomeViewModel 초기화됨");
    fetchProducts();
  }

  List<SharePostResponse> get products => _products;
  int get currentIndex => _currentIndex;
  String get currentLocation => _currentLocation;
  List<String> get locations => _locations;

  String get currentAppBarTitle {
    return _currentIndex == 0 ? _currentLocation : _appBarTitles[_currentIndex];
  }

  final List<String> _appBarTitles = ["홈", "동네생활", "채팅", "마이페이지"];

  void updateIndex(int index) {
    _currentIndex = index;
    print("🧭 현재 index: $_currentIndex");
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
        size: 5,
        location: _currentLocation,
      );

      print("📥 서버 응답 성공");
      print("🧱 content raw: ${response.content}");

      _products = response.content.map((post) {
        print("🧱 게시글 title: ${post.title} (${post.id})");
        return post;
      }).cast<SharePostResponse>().toList();
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
    const CommunityScreen(),
    const ChatScreen(),
    const MyPageScreen(),
  ];
}
