import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // ✅ 앱바를 배경 위로 확장
      appBar: AppBar(
        backgroundColor: Colors.transparent, // ✅ 투명 배경
        elevation: 0, // ✅ 그림자 제거
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // 뒤로 가기 아이콘
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/svg/home_white.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // ✅ 배경 이미지 (상단에 표시될 부분)
          Positioned.fill(
            child: Image.network(
              'https://your-image-url.com/headphones.jpg', // 실제 이미지 URL로 변경
              fit: BoxFit.cover,
            ),
          ),
          // ✅ 아래쪽 내용 (스크롤 가능)
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 300), // 앱바 밑 공간 확보
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "소니 WH-1000XM5 실버 나눔합니다.",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("8/31일 해외직구한 한달도 안된제품입니다."),
                      // 추가 UI 요소...
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
