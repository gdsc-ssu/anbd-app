import 'package:freezed_annotation/freezed_annotation.dart';

part 'bid_list_response.freezed.dart';
part 'bid_list_response.g.dart';

@freezed
class BidResponse with _$BidResponse {
  const factory BidResponse({
    required int id,
    required String content,
    required int donation,
    bool? isSelected,
    required UserInfo user,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BidResponse;

  factory BidResponse.fromJson(Map<String, dynamic> json) =>
      _$BidResponseFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int userId,
    required String nickname,
    required String email,
    required String profileImage,
    required String gender,
    required String birthDate,
    required String neighborhood,
    required List<dynamic> shareCategories, // 리스트 안 타입 필요시 수정
    required int reliability,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
