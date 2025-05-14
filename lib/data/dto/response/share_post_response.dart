import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_profiles_response.dart';

part 'share_post_response.freezed.dart';
part 'share_post_response.g.dart';

@freezed
class SharePostResponse with _$SharePostResponse {
  const factory SharePostResponse({
    required int id,
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
    required UserProfilesResponse userProfileResponse,
  }) = _SharePostResponse;

  factory SharePostResponse.fromJson(Map<String, dynamic> json) =>
      _$SharePostResponseFromJson(json);
}
