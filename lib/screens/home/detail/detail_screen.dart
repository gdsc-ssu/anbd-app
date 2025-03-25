import 'package:anbd/constants/colors.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/models/product_detail_model.dart';
import 'package:anbd/screens/home/detail/bidder_list.dart';
import 'package:anbd/screens/home/detail/recommend_list.dart';
import 'package:anbd/screens/home/detail/report_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:anbd/screens/home/detail/detail_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/home/detail/top_image.dart';
import 'package:anbd/screens/home/detail/user_info.dart';
import 'package:anbd/screens/home/detail/content.dart';
import 'package:anbd/screens/home/detail/bid_bottom_sheet.dart';
import 'package:anbd/screens/home/detail/ai_description.dart';

class DetailScreen extends StatefulWidget {
  final String productId;

  const DetailScreen({super.key, required this.productId});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isBidPlaced = false;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final extra = GoRouterState
          .of(context)
          .extra as Map<String, dynamic>?;
      final postId = extra?['id'] as int?;
      print('postId 잘 오니? $postId');
      if (postId != null) {
        context.read<DetailViewModel>().fetchPost(postId);
      }
    });
  }

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
    final post = viewModel.post;

    if (post == null) {
      return const Scaffold (
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final product = viewModel.post!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: _buildTransparentAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTopImage(product),
            _buildUserInfo(product),
            _buildContent(product),
            _buildDescription(product),
            _buildReportButton(),
            _buildBidderList(product),
            _buildRecommendList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBidButton(isBidPlaced),
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

  Widget _buildTopImage(SharePostResponse product) => TopImage(product: product);
  Widget _buildUserInfo(SharePostResponse product) => UserInfo(product: product);
  Widget _buildContent(SharePostResponse product) => Content(product: product);
  Widget _buildDescription(SharePostResponse product) => Description(product: product);
  Widget _buildReportButton() => const ReportButton();
  Widget _buildBidderList(SharePostResponse product) => BidderList(product: product);
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
                Expanded(
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
        ],
      ),
    );
  }

}
