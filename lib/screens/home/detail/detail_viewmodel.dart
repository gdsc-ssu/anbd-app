import 'package:flutter/foundation.dart';
import 'package:anbd/models/product_detail_model.dart';
import 'package:anbd/data/service/share_post_service.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';

class DetailViewModel extends ChangeNotifier {
  SharePostResponse? _post;
  SharePostResponse? get post => _post;

  final SharePostService _sharePostService;

  DetailViewModel({String? token}) : _sharePostService = SharePostService(token: token);

  Future<void> fetchPost(int postId) async {
    print("📡 fetchPostDetail 호출됨: postId=$postId");
    try {
      final response = await _sharePostService.fetchPost(postId);
      print("📡 fetchPostDetail 호출됨: postId=$postId");
      _post = response;
      notifyListeners();
    } catch (e) {
      print('❌ 게시글 로딩 실패: $e');
    }
  }
}
