import 'dart:developer';

import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:anbd/data/service/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late Dio _dio;
  final SecureStorageRepository _secureStorage = SecureStorageRepository();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: dotenv.get("base_url"),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    /// Token Interceptor 추가
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (options.extra['skipAuthToken'] != true) {
          var token = await _secureStorage.readAccessToken();
          log("secureStorage $token");
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        log('요청 보내는 중: ${options.method} ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        /// 응답 처리
        log('응답 : ${response.statusCode}');
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        final requestOptions = e.requestOptions;

        // 이미 재시도를 했거나, refresh 요청이라면 재시도 하지 않음
        if (requestOptions.extra['retry'] == true ||
            requestOptions.path.contains('reissue')) {
          log('[Interceptor] 이미 토큰 재시도를 했거나 재발급 요청 자체가 실패했습니다. 재시도 중단.');
          return handler.reject(e);
        }

        /// 406 error일 경우 토큰 재발급
        if (e.response?.statusCode == 406) {
          try {
            log('[Interceptor] 406 → 토큰 재발급 시도 중...');

            final authService = GetIt.instance<AuthService>();
            await authService.getRefreshToken();

            final newToken = await _secureStorage.readAccessToken();
            if (newToken == null) throw Exception('재발급된 토큰이 없습니다.');

            final clonedRequest = await _dio.request(
              requestOptions.path,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
              options: Options(
                method: requestOptions.method,
                headers: {
                  ...requestOptions.headers,
                  'Authorization': 'Bearer $newToken',
                },
                extra: {
                  ...requestOptions.extra,
                  'retry': true,
                },
              ),
            );

            return handler.resolve(clonedRequest);
          } catch (refreshError) {
            log('[Interceptor] 토큰 재발급 실패: $refreshError');
            return handler.reject(e); // 재발급 실패 시 기존 에러 반환
          }
        }

        return handler.next(e);
      },
    ));

    // Log Interceptor 추가
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (obj) {
        log("서버통신 $obj");
      },
    ));
  }

  Dio get dio => _dio;
}
