import 'dart:developer';

import 'package:anbd/constants/apis.dart';
import 'package:anbd/data/di/api_client.dart';
import 'package:anbd/data/dto/response/base_response.dart';
import 'package:anbd/data/dto/response/chatting_messages_response.dart';
import 'package:anbd/data/dto/response/chatting_room_response.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:dio/dio.dart';

class ChatService {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();
  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";

  ///GET 나의 채팅방 조회
  Future<List<ChattingRoomResponse>> getChattingRoomList() async {
    try {
      final response = await _apiClient.dio.get(
        '$apiVersion${Apis.chattingRoom}',
        options: Options(
          extra: {'skipAuthToken': false},
        ),
      );

      final baseResponse = BaseResponse.fromJson(
        response.data,
        (json) => (json as List<dynamic>)
            .map(
                (e) => ChattingRoomResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

      return baseResponse.body;
    } on DioException catch (e) {
      _handleDioException(e);
      throw Exception('Unreachable');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  ///GET 특정 채팅방의 메세지 조회
  Future<PageResponse> getChattingMessages({
    required int roomId,
    int page = 0,
    int size = 1,
    List<String> sort = const [],
  }) async {
    try {
      final response = await _apiClient.dio.get(
        '$apiVersion${Apis.chattingRoom}/$roomId/messages',
        queryParameters: {
          'page': page,
          'size': size,
          'sort': sort, // sort: ["timestamp,desc"] 같은 값 전달 가능
        },
        options: Options(
          extra: {'skipAuthToken': false},
        ),
      );

      final baseResponse = BaseResponse.fromJson(
        response.data,
        (json) => PageResponse.fromJson(json as Map<String, dynamic>),
      );

      return baseResponse.body;
    } on DioException catch (e) {
      _handleDioException(e);
      throw Exception('Unreachable');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// 공통 에러 핸들러
  void _handleDioException(DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        throw Exception('Bad Request (400). Please check the request.');
      case 401:
        throw Exception('Authentication failed (401).');
      case 404:
        throw Exception('Not Found (404). 존재하지 않는 게시글입니다.');
      case 406:
        throw Exception('Not Acceptable (406). 잘못된 요청입니다.');
      case 500:
        throw Exception('Internal Server Error (500). 서버 오류.');
      default:
        throw Exception('Error: ${e.response?.statusCode} ${e.message}');
    }
    throw Exception('Unreachable');
  }

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
