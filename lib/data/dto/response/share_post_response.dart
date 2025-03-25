import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_post_response.freezed.dart';
part 'share_post_response.g.dart';

@freezed
class SharePostResponse with _$SharePostResponse {
  const factory SharePostResponse({
    required int id,
    required int userId,
    required String? title,
    required String? category,
    required String? content,
    required List<String> images,
    required String? type,
    required String? description,
    required String? location,
    required bool isSold,
    required int hits,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int likeCount,
    required bool isLiked,
    required bool isBid,
  }) = _SharePostResponse;

  factory SharePostResponse.fromJson(Map<String, dynamic> json) =>
      _$SharePostResponseFromJson(json);
}
