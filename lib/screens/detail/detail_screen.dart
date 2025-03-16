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
            _buildUserInfo(), // 🔥 사용자 정보 추가
            const SizedBox(height: 20),
            _buildContent(product),
          ],
        ),
      ),
      bottomSheet: _buildBottomSheet(),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
          Row(
            children: [
              Text(
                "관심",
                style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
              ),
              const SizedBox(width: 4),
              Text(
                product.likeCount.toString(),
                style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
              ),
            ],
          ),
        ],
      ),
    );
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
