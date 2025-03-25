import 'package:anbd/data/di/api_client.dart';
import 'package:dio/dio.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/data/dto/response/share_all_post_response.dart';
import 'package:anbd/data/dto/response/base_response.dart';
import 'package:anbd/constants/apis.dart';

class SharePostService {
  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";
  final String? token;

  SharePostService({this.token});

  /// ✅ 단일 게시글 조회
  Future<SharePostResponse> fetchPost(int id) async {
    try {
      final response = await _apiClient.dio.get(
        '$apiVersion${Apis.getSharePostList}/$id',
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
        '$apiVersion${Apis.getSharePostList}',
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
