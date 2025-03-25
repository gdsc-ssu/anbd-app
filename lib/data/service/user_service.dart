import 'dart:developer';

import 'package:anbd/constants/constants.dart';
import 'package:anbd/data/di/api_client.dart';
import 'package:anbd/data/dto/response/base_response.dart';
import 'package:anbd/data/dto/response/token_response.dart';
import 'package:dio/dio.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";

  /// 최초 회원가입시 사용자 프로필 업데이트
  Future<TokenResponse> putUsersProfiles(String? gender, String? birthDate,
      String? neighborhood, List<String> shareCategories) async {
    try {
      final response = await _apiClient.dio.put(
        options: Options(
          extra: {'skipAuthToken': false},
        ),
        apiVersion + Apis.putUsersProfiles,
        data: {
          'gender': gender,
          'birthDate': birthDate,
          'neighborhood': neighborhood,
          'shareCategories': shareCategories,
        },
      );

      if (response.statusCode == 200) {
        final baseResponse = BaseResponse<TokenResponse>.fromJson(
          response.data,
          (contentJson) => TokenResponse.fromJson(contentJson),
        );

        log("응답 메세지 : ${baseResponse.body}");

        return baseResponse.body;
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
