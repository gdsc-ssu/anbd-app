import 'package:flutter/material.dart';
import 'package:anbd/screens/community/community_screen.dart';
import 'package:anbd/screens/chat/chat_screen.dart';
import 'package:anbd/screens/mypage/mypage_screen.dart';
import 'package:anbd/models/product_model.dart';
import 'package:anbd/widgets/product_item.dart';
import 'package:anbd/data/service/share_post_service.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  bool isLoading = true;
  List<Product> _products = [];

  String _currentLocation = "군자동";
  final List<String> _locations = ["군자동", "광진구 구의제3동", "동대문구 휘경동"];

  final SharePostService _service = SharePostService();

  HomeViewModel() {
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

  // ✅ 실제 API를 통한 데이터 불러오기 (최종 구현본)
  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      // 실제 앱에서는 목록 조회 API를 호출해야 하지만, 임시로 예시 id를 사용
      List<int> postIds = [1, 2, 3];

      List<Product> loadedProducts = [];

      for (int id in postIds) {
        SharePostResponse response = await _service.fetchPost(id);
        loadedProducts.add(_mapResponseToProduct(response));
      }

      _products = loadedProducts;
    } catch (e) {
      print("에러 발생: $e");
      _products = [];
    }

    isLoading = false;
    notifyListeners();
  }

  // ✅ API 응답을 Product 모델로 변환하는 전용 메서드
  Product _mapResponseToProduct(SharePostResponse response) {
    return Product(
      id: response.id,
      userId: response.userId,
      title: response.title,
      category: response.category,
      content: response.content,
      images: response.images,
      type: response.type,
      description: response.description,
      location: response.location,
      isSold: response.isSold,
      hits: response.hits,
      createdAt: response.createdAt,
      updatedAt: response.updatedAt,
      likeCount: response.likeCount,
      isLiked: response.isLiked,
    );
  }

  // ✅ 화면 전환
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
