import 'dart:io';

import 'package:anbd/data/di/api_client.dart';
import 'package:dio/dio.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/data/dto/response/share_all_post_response.dart';
import 'package:anbd/data/dto/response/base_response.dart';
import 'package:anbd/constants/apis.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:anbd/data/dto/request/bid_request.dart';
import 'package:anbd/data/dto/response/bid_list_response.dart';

class SharePostService {
  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";
  final String? token;
  final overrideToken = FlutterConfig.get('master_access_token');

  SharePostService({this.token});

  /// ✅ 단일 게시글 조회
  Future<SharePostResponse> fetchPost(int id) async {
    try {
      final response = await _apiClient.dio.get(
        '$apiVersion${Apis.sharePosts}/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${overrideToken ?? token}',
            'Accept': 'application/json;charset=UTF-8',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      ); // ✅ 여기가 닫히는 괄호

      print("📥 서버 응답 원본: ${response.data}");

      final baseResponse = BaseResponse.fromJson(
        response.data,
        (json) => SharePostResponse.fromJson(json),
      );

      return baseResponse.body;
    } on DioException catch (e) {
      _handleDioException(e);
      throw Exception('Unreachable');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// ✅ 전체 게시글 목록 조회 (pagination, location 필터 가능)
  Future<ShareAllPostResponse> fetchAllPosts({
    int page = 0,
    int size = 10,
    String sort = 'createdAt,desc',
    String? location,
    String? overrideToken,
  }) async {
    try {
      final queryParameters = {
        'page': page,
        'size': size,
        'sort': sort,
        if (location != null) 'location': location,
      };

      final response = await _apiClient.dio.get(
        '$apiVersion${Apis.sharePosts}',
        queryParameters: queryParameters,
        options: Options(
          extra: {'skipAuthToken': true},
          headers: {
            'Authorization': 'Bearer ${overrideToken ?? token}',
            'Accept': 'application/json;charset=UTF-8',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        final baseResponse = BaseResponse<ShareAllPostResponse>.fromJson(
          response.data,
          (contentJson) => ShareAllPostResponse.fromJson(contentJson),
        );
        return baseResponse.body;
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      _handleDioException(e);
      throw Exception('Unreachable');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// 나눔글 생성
  Future<SharePostResponse> postSharePosts(
    String title,
    String content,
    String type,
    List<File> images,
  ) async {
    try {
      final formData = FormData.fromMap({
        'images': await Future.wait(images.map((file) async {
          return await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          );
        })),
      });
      final response = await _apiClient.dio.post(
        '$apiVersion${Apis.createSharePosts}',
        queryParameters: {
          'title': title,
          'content': content,
          'type': type,
        },
        data: formData,
        options: Options(
          extra: {'skipAuthToken': true},
          headers: {
            'Authorization': 'Bearer $overrideToken',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      final baseResponse = BaseResponse.fromJson(
        response.data,
        (json) => SharePostResponse.fromJson(json),
      );

      return baseResponse.body;
    } on DioException catch (e) {
      _handleDioException(e);
      throw Exception('Unreachable');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// 나눔받기 요청 전송
  Future<void> postBid({
    required int postId,
    required BidRequest bidRequest,
    String? overrideToken,
  }) async {
    try {
      final response = await _apiClient.dio.post(
        '$apiVersion${Apis.sharePosts}/$postId/bid',
        data: bidRequest.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${overrideToken ?? token}',
            'Accept': 'application/json;charset=UTF-8',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      print("✅ 나눔 받기 요청 성공: ${response.statusCode}");
    } on DioException catch (e) {
      _handleDioException(e);
      throw Exception('나눔 받기 요청 실패: Unreachable');
    } catch (e) {
      throw Exception('나눔 받기 요청 실패: $e');
    }
  }

  Future<List<BidResponse>> fetchBids({
    required int postId,
    String? overrideToken,
  }) async {
    try {
      final response = await _apiClient.dio.get(
        '$apiVersion${Apis.sharePosts}/$postId/bids',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${overrideToken ?? token}',
            'Accept': 'application/json;charset=UTF-8',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      final baseResponse = BaseResponse.fromJson(
        response.data,
            (json) => (json as List<dynamic>)
            .map((e) => BidResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

      return baseResponse.body;
    } on DioException catch (e) {
      _handleDioException(e);
      throw Exception('입찰 정보 불러오기 실패: Unreachable');
    } catch (e) {
      throw Exception('입찰 정보 불러오기 실패: $e');
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
}
