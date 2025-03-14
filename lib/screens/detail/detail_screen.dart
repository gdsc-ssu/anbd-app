import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anbd/constants/constants.dart';

class DetailScreen extends StatefulWidget {
  final String productId;

  const DetailScreen({super.key, required this.productId});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isBidPlaced = false; // ✅ 입찰 여부 상태

  void toggleBidStatus() {
    setState(() {
      isBidPlaced = !isBidPlaced;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // ✅ AppBar를 배경 위로 확장
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent, // ✅ AppBar 투명하게 만들기
          elevation: 0, // ✅ 그림자 제거
          automaticallyImplyLeading: false, // ✅ 기본 back 버튼 제거
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ✅ 왼쪽 아이콘 (뒤로 가기, 홈)
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_left, size: 30, color: AnbdColor.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: SvgPicture.asset("assets/svg/home_white.svg"),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  // ✅ 오른쪽 아이콘 (공유, 더보기)
                  Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset("assets/svg/share.svg"),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset("assets/svg/menu.svg"),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // ✅ 배경 이미지 추가 (AppBar 뒤로 확장)
          Positioned.fill(
            child: Image.asset(
              "assets/images/placeholder.png",
              fit: BoxFit.cover,
            ),
          ),
          // ✅ 상세 정보 & 바텀 시트
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 200), // ✅ 이미지와 중복 방지
                      Text(
                        "상품 ID: ${widget.productId}",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              _buildBottomSheet(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isBidPlaced
              ? const Text("입찰이 완료되었습니다!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              : const Text("입찰을 진행하시겠습니까?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: toggleBidStatus,
            child: Text(isBidPlaced ? "입찰 취소하기" : "입찰하기"),
          ),
        ],
      ),
    );
  }
}
