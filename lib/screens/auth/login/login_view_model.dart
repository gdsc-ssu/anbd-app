import 'package:anbd/common/enums/login_platform.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  LoginPlatform get loginPlatform => _loginPlatform;

  LoginViewModel();
}
