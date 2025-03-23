import 'package:anbd/data/di/api_client.dart';
import 'package:dio/dio.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/data/dto/response/base_response.dart';

class SharePostService {
  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";

  Future<SharePostResponse> fetchPost(int id) async {
    final response = await _apiClient.dio.get('/api/posts/$id');

    if (response.statusCode == 200) {
      final baseResponse = BaseResponse.fromJson(
          response.data, (json) => SharePostResponse.fromJson(json));

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
          'Failed to post share-posts API: ${response.statusCode} ${response.statusMessage}');
    }
  }
}
