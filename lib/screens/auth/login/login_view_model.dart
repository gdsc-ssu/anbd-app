import 'dart:developer';

import 'package:anbd/common/enums/login_platform.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends ChangeNotifier {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  LoginPlatform get loginPlatform => _loginPlatform;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  late bool _isNewUser;

  bool get isNewUser => _isNewUser;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      log('name = ${googleUser.displayName}');
      log('email = ${googleUser.email}');
      log('id = ${googleUser.id}');

      final name = googleUser.displayName;

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final authCode = googleSignInAuthentication.accessToken;
      log("토큰: $authCode");

      /*try {
        final response = await refreshService.getAccessToken(authCode!, name!);

        await _saveUserInfo(googleUser.displayName, googleUser.email);
        _loginPlatform = LoginPlatform.google;

        _isNewUser = response.newAccount;

        notifyListeners();
      } catch (e) {
        log("Exception occurred: $e");
        _errorMessage = 'Google 로그인에 실패했습니다. 다시 시도해주세요.';

        if (e is DioException) {
          log("DioError details: ${e.response?.data}");
        }
        notifyListeners();
      }

      notifyListeners();
    }
    }*/
    }

    Future<void> _saveUserInfo(String? name, String email) async {
      final SecureStorageRepository secureStorage = SecureStorageRepository();
      secureStorage.saveUserName(name ?? '');
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
}
