import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';

part 'product_detail_model.freezed.dart';
part 'product_detail_model.g.dart';

@freezed
class ProductDetail with _$ProductDetail {
  const factory ProductDetail({
    required int id,
    required String title,
    required String content,
    required List<String> images,
    required String description,
    required int likeCount,
    required bool isLiked,
  }) = _ProductDetail;

  /// JSON 지원
  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  /// ✅ SharePostResponse → ProductDetail 변환
  factory ProductDetail.fromResponse(SharePostResponse res) {
    return ProductDetail(
      id: res.id,
      title: res.title ?? '',
      content: res.content ?? '',
      images: res.images,
      description: res.description ?? '',
      likeCount: res.likeCount,
      isLiked: res.isLiked,
    );
  }
}
