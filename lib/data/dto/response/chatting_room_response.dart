import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatting_room_response.freezed.dart';
part 'chatting_room_response.g.dart';

@freezed
class ChattingRoomResponse with _$ChattingRoomResponse {
  const factory ChattingRoomResponse({
    required int id,
    required Partner partner,
    required SharePost sharePost,
  }) = _ChattingRoomResponse;

  factory ChattingRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$ChattingRoomResponseFromJson(json);
}

@freezed
class Partner with _$Partner {
  const factory Partner({
    required int userId,
    required String nickname,
    required String profileImage,
    required String neighborhood,
    required int reliability,
  }) = _Partner;

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);
}

@freezed
class SharePost with _$SharePost {
  const factory SharePost({
    required int id,
    required String title,
    required String category,
    required String content,
    required List<String> images,
    required String type,
    required String description,
    required String location,
    required bool isSold,
    required int hits,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int likeCount,
    required bool isLiked,
    required bool isBid,
    required Partner userProfileResponse,
  }) = _SharePost;

  factory SharePost.fromJson(Map<String, dynamic> json) =>
      _$SharePostFromJson(json);
}
