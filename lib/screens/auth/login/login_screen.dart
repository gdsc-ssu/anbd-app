import 'package:anbd/common/enums/login_platform.dart';
import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/auth/login/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<LoginViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center, // 가로축 가운데 정렬
                  children: [
                    SvgPicture.asset(
                      'assets/anbd_logo.svg',
                      width: 150,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '아껴쓰고 나눠쓰고 바꿔쓰고 다시쓰자',
                      textAlign: TextAlign.center,
                      style: AnbdTextStyle.TitleSB18,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      '무료 나눔부터 기부까지\n지금 내 동네를 선택하고 시작해보세요!',
                      textAlign: TextAlign.center,
                      style: AnbdTextStyle.Body16,
                    ),
                    const SizedBox(height: 50),
                    _loginButton(
                      platform: LoginPlatform.google,
                      onTap: () {
                        ///클릭시 구글 로그인 구현
                      },
                    ),
                    const SizedBox(height: 15),
                    _loginButton(
                      platform: LoginPlatform.apple,
                      onTap: () {
                        /// 클릭시 애플 로그인 구현
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '로그인 없이 사용하고 싶나요?',
                          style: AnbdTextStyle.BodyL12.copyWith(
                              color: AnbdColor.systemGray03),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '둘러보기',
                          style: AnbdTextStyle.BodyL12.copyWith(
                              color: AnbdColor.blue),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton({
    required LoginPlatform platform,
    required VoidCallback onTap,
  }) {
    String getPlatformAsset(LoginPlatform platform) {
      switch (platform) {
        case LoginPlatform.google:
          return 'assets/images/login/google_login.svg';
        case LoginPlatform.apple:
          return 'assets/images/login/apple_login.svg';
        default:
          return '';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            getPlatformAsset(platform),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
