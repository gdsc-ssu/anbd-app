import 'package:anbd/constants/constants.dart';
import 'package:anbd/screens/mypage/mypage_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    backgroundColor: AnbdColor.systemGray02,
                    backgroundImage: imageUrl != null && imageUrl.isNotEmpty
                        ? NetworkImage(imageUrl)
                        : const AssetImage('assets/images/mypage_img.png')
                            as ImageProvider,
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Consumer<MyPageViewModel>(
                  builder: (context, viewModel, _) {
                    return Text(
                      viewModel.name ?? '사용자',
                      style: AnbdTextStyle.TitleSB18,
                    );
                  },
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 4),
              Text("다음 레벨업까지 4점 남았어요!", style: AnbdTextStyle.Body10),
            ],
          ),
          const SizedBox(height: 30),

          /// 나의 활동
          const Text("나의 활동", style: AnbdTextStyle.BodySB15),
          const SizedBox(height: 15),
          _buildMenuItem("관심 목록", 'assets/svg/heart.svg', () {
            context.push('/liked'); // GoRouter 사용 시 경로에 맞게
          }),
          const SizedBox(height: 15),
          _buildMenuItem("판매내역", 'assets/svg/delivery.svg', (){}),
          const SizedBox(height: 15),
          _buildMenuItem("구매내역", 'assets/svg/product.svg', (){}),

          const SizedBox(height: 30),

          /// 기타
          const Text("기타", style: AnbdTextStyle.BodySB15),
          const SizedBox(height: 20),

          Consumer<MyPageViewModel>(
            builder: (context, viewModel, _) => GestureDetector(
              onTap: () {
                viewModel.logOut();
                context.push(Paths.login);
              },
              child: const Text(
                "로그아웃",
                style: AnbdTextStyle.BodySB15,
              ),
            ),
          ),
          const SizedBox(height: 15),

          Consumer<MyPageViewModel>(
            builder: (context, viewModel, _) => GestureDetector(
              onTap: () {
                viewModel.signOut(context);
                context.push(Paths.login);
              },
              child: Text(
                "회원탈퇴",
                style: AnbdTextStyle.BodySB15.copyWith(
                  color: AnbdColor.systemGray03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, String icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 20, height: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: AnbdTextStyle.BodySB15,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }
}
