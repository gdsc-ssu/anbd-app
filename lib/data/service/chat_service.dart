import 'dart:developer';

import 'package:anbd/data/di/api_client.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:dio/dio.dart';

class ChatService {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();
  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";

  /// 채팅방 생성 API
  Future<void> makeChatRoom({
    required int partnerId,
    required int sharePostId,
  }) async {
    try {
      final response = await _apiClient.dio.post(
        '${apiVersion}chat/room',
        data: {
          "partnerId": partnerId,
          "sharePostId": sharePostId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          extra: {'skipAuthToken': false}, // 필요 시 인증 설정
        ),
      );

      log("✅ 채팅방 생성 성공: ${response.data}");
    } on DioException catch (e) {
      log("❌ 채팅방 생성 실패: ${e.response?.data ?? e.message}");
      throw Exception("채팅방 생성 실패: ${e.message}");
    }
  }
}
