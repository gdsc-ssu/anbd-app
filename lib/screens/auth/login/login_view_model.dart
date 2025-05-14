import 'dart:developer';

import 'package:anbd/common/enums/login_platform.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:anbd/data/service/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io' show Platform;

class LoginViewModel extends ChangeNotifier {
  final AuthService authService = GetIt.instance<AuthService>();

  LoginPlatform _loginPlatform = LoginPlatform.none;

  LoginPlatform get loginPlatform => _loginPlatform;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  late bool _isNewUser;

  bool get isNewUser => _isNewUser;

  bool? profileComplete;

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = Platform.isIOS
        ? GoogleSignIn(
            clientId: dotenv.get("CLIENT_ID"),
            scopes: ['email', 'profile'],
          )
        : GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      log('name = ${googleUser.displayName}');
      log('email = ${googleUser.email}');
      log('id = ${googleUser.id}');

      /// 구글 서버에서 authCode 받아오기
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final authCode = googleSignInAuthentication.accessToken;
      log("토큰: $authCode");

      try {
        final response = await authService.getAccessToken(authCode!);

        await _saveUserInfo(googleUser.displayName, googleUser.email);
        _loginPlatform = LoginPlatform.google;
        profileComplete = response.profileComplete;

        notifyListeners();
      } catch (e) {
        log("Exception occurred: $e");
        _errorMessage = 'Google 로그인에 실패했습니다. 다시 시도해주세요.';

        if (e is DioException) {
          log("DioError details: ${e.response?.data}");
          rethrow;
        }
        rethrow;
        notifyListeners();
      }
    }
  }

  Future<void> _saveUserInfo(String? name, String email) async {
    final SecureStorageRepository secureStorage = SecureStorageRepository();
    secureStorage.saveUserName(name ?? '사용자');
    secureStorage.saveUserEmail(email);
  }

  Future<void> signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.google:
        await GoogleSignIn().signOut();
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none:
        break;
    }

    _loginPlatform = LoginPlatform.none;
    notifyListeners();
  }
}
