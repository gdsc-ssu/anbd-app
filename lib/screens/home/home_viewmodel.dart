// import 'package:flutter/material.dart';
//
// class HomeViewModel extends ChangeNotifier {
//   int _currentIndex = 0;
//
//   int get currentIndex => _currentIndex;
//
//   void updateIndex(int index) {
//     _currentIndex = index;
//     notifyListeners(); // ✅ UI 업데이트
//   }
//
//   Widget get currentScreen {
//     switch (_currentIndex) {
//       case 0:
//         return Center(child: Text("홈 화면"));
//       case 1:
//         return Center(child: Text("동네 생활"));
//       case 2:
//         return Center(child: Text("채팅"));
//       default:
//         return Center(child: Text("마이페이지"));
//     }
//   }
// }

import 'package:flutter/material.dart';
// import 'package:anbd/screens/community/community_page.dart';
// import 'package:anbd/screens/chat/chat_page.dart';
// import 'package:anbd/screens/mypage/mypage_page.dart';
import 'package:anbd/models/product_model.dart';
import 'package:anbd/widgets/product_item.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  bool isLoading = true;
  List<Product> _products = [];

  HomeViewModel() {
    fetchProducts();
  }

  List<Product> get products => _products;
  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // ✅ 백엔드에서 데이터 불러오기 (예제 데이터 사용)
  Future<void> fetchProducts() async {
    await Future.delayed(Duration(seconds: 2)); // API 호출 시뮬레이션

    _products = [
      Product(
        title: "에어팟 프로",
        location: "군자동",
        timeAgo: "3일 전",
        imageUrl: "https://images.unsplash.com/photo-1573148164257-99a17c75ae6c", // ✅ 정상적인 URL 사용
        comments: 3,
        likes: 11,
        isFree: true,
      ),
      Product(
        title: "바이레도 블랑쉬 50ml",
        location: "광진구 구의제3동",
        timeAgo: "26초 전",
        imageUrl: "https://images.unsplash.com/photo-1591076482161-246ef5a30861", // ✅ 정상적인 URL 사용
        comments: 0,
        likes: 2,
      ),
      Product(
        title: "샌드위치",
        location: "동대문구 휘경동",
        timeAgo: "59초 전",
        imageUrl: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c", // ✅ 정상적인 URL 사용
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
      return Center(child: CircularProgressIndicator());
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
    // CommunityPage(),
    // ChatPage(),
    // MyPage(),
  ];
}
