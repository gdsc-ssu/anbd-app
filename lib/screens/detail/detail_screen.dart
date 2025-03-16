import 'package:anbd/models/product_detail_model.dart';
import 'package:anbd/screens/detail/bidder_list.dart';
import 'package:anbd/screens/detail/report_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/screens/detail/detail_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/detail/top_image.dart';
import 'package:anbd/screens/detail/user_info.dart';
import 'package:anbd/screens/detail/content.dart';

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
    return const TopImage();
  }

  Widget _buildUserInfo() {
    return const UserInfo();
  }

  Widget _buildContent(ProductDetail product) {
    return Content(product: product);
  }

  Widget _buildReportButton() {
    return const ReportButton();
  }

  Widget _buildBidderList() {
    return const BidderList();
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
