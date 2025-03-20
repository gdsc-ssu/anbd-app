import 'dart:developer';

import 'package:anbd/common/enums/login_platform.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';
import 'package:anbd/data/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService authService = GetIt.instance<AuthService>();

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

      /// 구글 서버에서 authCode 받아오기
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final authCode = googleSignInAuthentication.accessToken;
      log("토큰: $authCode");

      /// 서버에서 구글 authCode로 access Token 받아오기
      await authService.getAccessToken(authCode!);

      await _saveUserInfo(googleUser.displayName, googleUser.email);

      _loginPlatform = LoginPlatform.google;
    }
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
