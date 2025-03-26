import 'package:anbd/constants/constants.dart';
import 'package:anbd/screens/mypage/mypage_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text(
          '마이페이지',
          style: AnbdTextStyle.TitleSB18,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/svg/setting.svg"),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AnbdColor.systemGray02,
            height: 1.0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          /// 사용자 정보
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<MyPageViewModel>(
                builder: (context, viewModel, _) {
                  final imageUrl = viewModel.imageUrl;

                  return CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: imageUrl != null && imageUrl.isNotEmpty
                        ? NetworkImage(imageUrl)
                        : const AssetImage('assets/images/mypage_img.png')
                            as ImageProvider,
                  );
                },
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Text(
                  '장환곤',
                  style: AnbdTextStyle.TitleSB18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// 레벨 진행 바
          Stack(
            children: [
              Container(
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 15,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.warning_amber, size: 16, color: Colors.amber),
              SizedBox(width: 4),
              Text("다음 레벨업까지 5점 남았어요!",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 24),

          /// 나의 활동
          const Text("나의 활동",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _buildMenuItem("관심 목록", Icons.favorite_border),
          _buildMenuItem("판매내역", Icons.receipt_long),
          _buildMenuItem("구매내역", Icons.shopping_bag_outlined),

          const SizedBox(height: 24),

          /// 기타
          const Text("기타",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          _buildMenuItem("로그아웃", Icons.logout),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text("회원탈퇴",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
