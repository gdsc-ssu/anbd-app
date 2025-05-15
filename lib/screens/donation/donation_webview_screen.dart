import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DonationWebViewScreen extends StatelessWidget {
  final String url;
  final VoidCallback onDonationCompleted;

  const DonationWebViewScreen({
    super.key,
    required this.url,
    required this.onDonationCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        title: const Text("기부 결제"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // ❌ 강제 종료 시 아무 일 없음
          },
        ),
      ),
      body: WebViewWidget(
        controller: controller
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (url) {
                if (url.contains("success")) {
                  // 예시: 결제 완료를 나타내는 URL 확인
                  Navigator.pop(context); // 웹뷰 닫고
                  onDonationCompleted(); // 이후 동작 실행
                }
              },
            ),
          ),
      ),
    );
  }
}
