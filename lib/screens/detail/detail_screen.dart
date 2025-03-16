import 'package:anbd/models/product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/screens/detail/detail_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:anbd/widgets/widgets.dart';

class DetailScreen extends StatefulWidget {
  final String productId;

  const DetailScreen({super.key, required this.productId});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isBidPlaced = false;

  void toggleBidStatus() {
    setState(() => isBidPlaced = !isBidPlaced);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    final product = viewModel.productDetail;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: _buildTransparentAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTopImage(),
            _buildUserInfo(),
            _buildContent(product),
            _buildReportButton(),
            _buildBidderList(),
            _buildRecommendList(),
          ],
        ),
      ),
      // bottomSheet: _buildBottomSheet(),
    );
  }

  PreferredSizeWidget _buildTransparentAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset("assets/svg/arrow_back.svg"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: SvgPicture.asset("assets/svg/home_white.svg"),
                    onPressed: () {},
                  ),
                ],
              ),
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
    );
  }

  Widget _buildTopImage() {
    return Image.asset(
      "assets/images/placeholder.png",
      fit: BoxFit.cover,
      width: double.infinity,
      // height: 300,
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/images/placeholder.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "감성탐방러",
                    style: AnbdTextStyle.BodyEB15,
                  ),
                  Text(
                    "중랑구 면목동",
                    style: AnbdTextStyle.BodyL12,
                  ),
                ],
              ),
            ],
          ),
        ),
        const BasicDivider(),
      ],
    );
  }

  Widget _buildContent(ProductDetail product) {
    String formatTimeAgo(DateTime createdAt) {
      final DateTime createdTime = createdAt.toLocal();
      final Duration diff = DateTime.now().difference(createdTime);

      if (diff.inMinutes < 1) {
        return '방금 전';
      } else if (diff.inMinutes < 60) {
        return '${diff.inMinutes}분 전';
      } else if (diff.inHours < 24) {
        return '${diff.inHours}시간 전';
      } else if (diff.inDays < 7) {
        return '${diff.inDays}일 전';
      } else {
        return '${createdTime.year}.${createdTime.month.toString().padLeft(2, '0')}.${createdTime.day.toString().padLeft(2, '0')}';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: AnbdTextStyle.TitleSB18,
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.category,
                    style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '·',
                    style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    formatTimeAgo(product.createdAt),
                    style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                product.description,
                style: AnbdTextStyle.Body14,
              ),
              const SizedBox(height: 16),
              Text(
                "관심 ${product.likeCount}",
                style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
              ),
            ],
          ),
        ),
        const BasicDivider(), // 구분선 추가
      ],
    );
  }

  Widget _buildReportButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "이 나눔글 신고하기",
                style: AnbdTextStyle.BodyEB15,
              ),
              SvgPicture.asset(
                'assets/svg/arrow_right.svg'),
            ],
          ),
        ),
        const BasicDivider(),
      ],
    );
  }

  Widget _buildBidderList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "입찰자",
            style: AnbdTextStyle.BodyEB15,
          ),
        ),
        const SizedBox(height: 16),
        _buildBidderTile('장환곤', '10000원', '저 이거 없으면 죽어요'),
        _buildBidderTile('장환곤', '1억', '너무나도 갖고싶습니다'),
      ],
    );
  }

  Widget _buildBidderTile(String name, String price, String comment) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 좌우 정렬 명확히 분리
            children: [
              // 이름과 가격 정보 (왼쪽에 고정)
              Text(
                '$name $price',
                style: AnbdTextStyle.Body14,
              ),
              // 댓글과 화살표 (오른쪽으로 정렬)
              Row(
                children: [
                  Text(
                    '“$comment”',
                    style: AnbdTextStyle.Body14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    "assets/svg/arrow_right.svg",
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AnbdColor.systemGray04,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendList() {
    return Column();
  }



  Widget _buildBottomSheet() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isBidPlaced ? "입찰이 완료되었습니다!" : "입찰을 진행하시겠습니까?",
            style: AnbdTextStyle.Body16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: toggleBidStatus,
            child: Text(isBidPlaced ? "입찰 취소하기" : "입찰하기"),
          ),
        ],
      ),
    );
  }
}
