// ✅ detail_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:anbd/data/service/share_post_service.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/data/dto/response/bid_list_response.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';

class DetailViewModel extends ChangeNotifier {
  SharePostResponse? _post;
  SharePostResponse? get post => _post;

  List<BidResponse> _bids = [];
  List<BidResponse> get bids => _bids;

  bool _isBidsLoading = false;
  bool get isBidsLoading => _isBidsLoading;

  bool isLiked = false;
  final SharePostService _sharePostService;

  DetailViewModel() : _sharePostService = SharePostService();

  Future<void> fetchPost(int postId) async {
    try {
      final response = await _sharePostService.fetchPost(postId);
      _post = response;
      isLiked = response.isLiked;
      notifyListeners();
    } catch (e) {
      print('❌ 게시글 로딩 실패: $e');
    }
  }

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

  Future<void> toggleLike(int postId) async {
    try {
      if (isLiked) {
        await _sharePostService.unlikePost(postId);
      } else {
        await _sharePostService.likePost(postId);
      }
      isLiked = !isLiked;
      notifyListeners();
    } catch (e) {
      print("❌ 좋아요 처리 실패: $e");
    }
  }

  /// ✅ 현재 유저가 이 글의 작성자인지
  Future<bool> isOwner() async {
    final storage = SecureStorageRepository();
    final userId = await storage.getUserId();
    return _post?.userProfileResponse.userId == userId;
  }
}
