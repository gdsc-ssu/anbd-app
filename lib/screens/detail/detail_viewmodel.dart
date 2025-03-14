import 'package:flutter/foundation.dart';
import 'package:anbd/models/product_detail_model.dart';

class DetailViewModel extends ChangeNotifier {
  late ProductDetail _productDetail;

  ProductDetail get productDetail => _productDetail;

  DetailViewModel() {
    fetchMockData();
  }

  void fetchMockData() {
    final mockJson = {
      "id": 1,
      "userId": 100,
      "title": "소니 Wh-1000xm5 실버 나눔합니다.",
      "category": "DIGITAL",
      "content": "8/31일 해외직구한 한달도 안된 제품입니다. 박풀 S급입니다.",
      "images": ["https://example.com/image.png"],
      "type": "SHARE",
      "description": "상세한 설명입니다.",
      "createdAt": "2025-03-14T10:42:29.023Z",
      "updatedAt": "2025-03-14T10:42:29.023Z",
      "likeCount": 15,
      "isLiked": true
    };

    _productDetail = ProductDetail.fromJson(mockJson);
    notifyListeners();
  }

}
