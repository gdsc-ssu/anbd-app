import 'package:flutter/foundation.dart';
import 'package:anbd/data/service/share_post_service.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/data/dto/response/bid_list_response.dart';

class DetailViewModel extends ChangeNotifier {
  SharePostResponse? _post;
  SharePostResponse? get post => _post;

  List<BidResponse> _bids = [];
  List<BidResponse> get bids => _bids;

  bool _isBidsLoading = false;
  bool get isBidsLoading => _isBidsLoading;

  final SharePostService _sharePostService;

  DetailViewModel({String? token}) : _sharePostService = SharePostService();

  /// ✅ 게시글 상세 정보 조회
  Future<void> fetchPost(int postId) async {
    print("📡 fetchPostDetail 호출됨: postId=$postId");
    try {
      final response = await _sharePostService.fetchPost(postId);
      _post = response;
      notifyListeners();
    } catch (e) {
      print('❌ 게시글 로딩 실패: $e');
    }
  }

  /// ✅ 입찰자 리스트 조회
  Future<void> fetchBids(int postId) async {
    _isBidsLoading = true;
    notifyListeners();

    try {
      final result = await _sharePostService.fetchBids(postId: postId);
      _bids = result;
    } catch (e) {
      print("❌ 입찰자 불러오기 실패: $e");
    } finally {
      _isBidsLoading = false;
      notifyListeners();
    }
  }
}
