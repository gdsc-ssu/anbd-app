import 'package:anbd/data/di/api_client.dart';
import 'package:dio/dio.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/data/dto/response/base_response.dart';
import 'package:anbd/constants/apis.dart';

class SharePostService {
  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";

  Future<SharePostResponse> fetchPost(int id) async {
    try {
      final response = await _apiClient.dio.get(
        '$apiVersion${Apis.sharePostList}/$id',
      );

      final baseResponse = BaseResponse.fromJson(
        response.data, (json) => SharePostResponse.fromJson(json),
      );

      return baseResponse.body;
    } on DioException catch (e) {
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
          throw Exception(
              'Error: ${e.response?.statusCode} ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
