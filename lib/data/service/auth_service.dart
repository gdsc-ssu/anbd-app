import 'dart:developer';

import 'package:anbd/constants/constants.dart';
import 'package:anbd/data/di/api_client.dart';
import 'package:anbd/data/dto/response/base_response.dart';
import 'package:anbd/data/dto/response/token_response.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:dio/dio.dart';

class AuthService {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();

  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";

  /// POST google 서버에서 받은 accessToken으로 서비스 accessToken 발급
  Future<TokenResponse> getAccessToken(String authCode) async {
    try {
      final response = await _apiClient.dio.post(
        options: Options(
          extra: {'skipAuthToken': false},
        ),
        apiVersion + Apis.getAccessToken,
        data: {
          'accessToken': authCode,
        },
      );

      if (response.statusCode == 200) {
        final baseResponse = BaseResponse<TokenResponse>.fromJson(
          response.data,
          (contentJson) => TokenResponse.fromJson(contentJson),
        );

        /// 토큰 저장 로직
        final tokenResponse = baseResponse.body;
        if (tokenResponse != null) {
          await _secureStorage.saveAccessToken(tokenResponse.accessToken);
          await _secureStorage.saveRefreshToken(tokenResponse.refreshToken);
        }

        return tokenResponse;
      } else if (response.statusCode == 400) {
        /// Bad Request
        throw Exception('Bad Request (400). Please check the request.');
      } else if (response.statusCode == 401) {
        /// 인증 실패
        throw Exception('Authentication failed (401).');
      } else if (response.statusCode == 404) {
        /// Not Found
        throw Exception('Not Found (404).');
      } else if (response.statusCode == 406) {
        /// Not Acceptable
        throw Exception('Not Acceptable (406).');
      } else if (response.statusCode == 500) {
        /// Internal Server Error
        throw Exception('Internal Server Error (500).');
      } else {
        throw Exception(
            'Failed to post GoogleAuth: ${response.statusCode} ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error: ${e.response?.data ?? e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
