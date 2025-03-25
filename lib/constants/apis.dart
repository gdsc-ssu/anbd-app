import 'dart:core';

abstract class Apis {
  Apis._();

  /// 변수명은 동사+목적어로 명명
  /// baseUrl 끝에 /가 있어서, 여기서는 맨 앞에 /을 빼고 기입

  /// 토큰 관련 api
  static const String getAccessToken = "auth/mobile/google";

  /// 나눔글 관련 api
  static const String sharePosts = "share-posts";

  /// user 관련 api
  static const String putUsersProfiles = "users/profiles";
}
