import 'package:flutter/material.dart';
import 'package:anbd/screens/community/community_screen.dart';
import 'package:anbd/screens/chat/chat_screen.dart';
import 'package:anbd/screens/mypage/mypage_screen.dart';
import 'package:anbd/models/product_model.dart';
import 'package:anbd/widgets/product_item.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  bool isLoading = true;
  List<Product> _products = [];

  String _currentLocation = "군자동"; // 기본 선택된 위치
  final List<String> _locations = ["군자동", "광진구 구의제3동", "동대문구 휘경동"];

  HomeViewModel() {
    fetchProducts();
  }

  List<Product> get products => _products;
  int get currentIndex => _currentIndex;
  String get currentLocation => _currentLocation;
  List<String> get locations => _locations;

  // ✅ 현재 선택된 탭의 제목 반환 (홈에서는 위치 표시)
  String get currentAppBarTitle {
    return _currentIndex == 0 ? _currentLocation : _appBarTitles[_currentIndex];
  }

  // ✅ AppBar에 표시할 제목 리스트
  final List<String> _appBarTitles = [
    "홈",       // index 0: 홈 (실제 사용 시 location으로 표시됨)
    "동네생활",  // index 1: Community
    "채팅",      // index 2: Chat
    "마이페이지"  // index 3: MyPage
  ];

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // ✅ 선택된 위치 업데이트
  void updateLocation(String newLocation) {
    _currentLocation = newLocation;
    notifyListeners();
  }

  // ✅ 백엔드에서 데이터 불러오기 (예제 데이터 사용)
  Future<void> fetchProducts() async {
    await Future.delayed(Duration(seconds: 2)); // API 호출 시뮬레이션

    _products = [
      Product(
        id : "1",
        title: "에어팟 프로",
        location: "군자동",
        timeAgo: "3일 전",
        imageUrl: "",
        comments: 3,
        likes: 11,
        isFree: true,
      ),
      Product(
        id: "2",
        title: "바이레도 블랑쉬 50ml",
        location: "광진구 구의제3동",
        timeAgo: "26초 전",
        imageUrl: "",
        comments: 0,
        likes: 2,
      ),
      Product(
        id: "3",
        title: "샌드위치",
        location: "동대문구 휘경동",
        timeAgo: "59초 전",
        imageUrl: "",
      ),
    ];

    isLoading = false;
    notifyListeners();
  }

  // ✅ 현재 선택된 화면 가져오기
  Widget get currentScreen {
    if (_currentIndex == 0) {
      return _buildHomeScreen(); // 홈 화면에 ProductItem 리스트 표시
    } else {
      return _screens[_currentIndex - 1]; // 나머지는 기존 화면 유지
    }
  }

  // ✅ 홈 화면: ProductItem 리스트
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

  // 기존 네비게이션 화면 리스트 (홈 제외)
  final List<Widget> _screens = [
    CommunityScreen(),
    ChatScreen(),
    MyPageScreen(),
  ];
}
