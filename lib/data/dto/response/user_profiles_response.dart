import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profiles_response.freezed.dart';
part 'user_profiles_response.g.dart';

@freezed
class UserProfilesResponse with _$UserProfilesResponse {
  const factory UserProfilesResponse({
    @JsonKey(name: 'userId') required int userId,
    @JsonKey(name: 'nickname') required String nickname,
    @JsonKey(name: 'profileImage') String? profileImage,
    @JsonKey(name: 'neighborhood') required String neighborhood,
    @JsonKey(name: 'reliability') required int reliability,
  }) = _UserProfilesResponse;

  factory UserProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfilesResponseFromJson(json);
}
