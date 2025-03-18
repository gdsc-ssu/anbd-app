import 'package:anbd/constants/colors.dart';
import 'package:anbd/models/product_detail_model.dart';
import 'package:anbd/screens/detail/bidder_list.dart';
import 'package:anbd/screens/detail/recommend_list.dart';
import 'package:anbd/screens/detail/report_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:anbd/screens/detail/detail_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/detail/top_image.dart';
import 'package:anbd/screens/detail/user_info.dart';
import 'package:anbd/screens/detail/content.dart';
import 'package:anbd/screens/detail/bid_bottom_sheet.dart';

class DetailScreen extends StatefulWidget {
  final String productId;

  const DetailScreen({super.key, required this.productId});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isBidPlaced = false;
  bool isLiked = false;

  void _openBidBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: BidBottomSheet(
          onBidCompleted: () {
            setState(() => isBidPlaced = true);
          },
        ),
      ),
    );
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
      bottomSheet: _buildBidButton(isBidPlaced),
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

  Widget _buildTopImage() => const TopImage();
  Widget _buildUserInfo() => const UserInfo();
  Widget _buildContent(ProductDetail product) => Content(product: product);
  Widget _buildReportButton() => const ReportButton();
  Widget _buildBidderList() => const BidderList();
  Widget _buildRecommendList() => const RecommendList();

  Widget _buildBidButton(bool isBidPlaced) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: SvgPicture.asset(
                    isLiked ? "assets/svg/heart_on.svg" : "assets/svg/heart_off.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(width: 8),

                // 구분선 Divider
                SvgPicture.asset("assets/svg/col_divider.svg"),
                const SizedBox(width: 16),

                // 입찰하기 버튼
                SizedBox(
                  width: 300,
                  child: BasicButton(
                    text: isBidPlaced ? "입찰 완료" : "입찰하기",
                    isClickable: !isBidPlaced, // ✅ 입찰 후 비활성화
                    onPressed: isBidPlaced ? null : _openBidBottomSheet,
                    size: BasicButtonSize.SMALL,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AnbdColor.white,
            height: 16,
            width: double.infinity,
          )
        ],
      ),
    );
  }

}
