import 'package:anbd/widgets/basic_divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anbd/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anbd/screens/home/detail/detail_viewmodel.dart';

class BidderList extends StatelessWidget {
  const BidderList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();

    if (viewModel.isBidsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.bids.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text("입찰자가 없습니다."),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("입찰자", style: AnbdTextStyle.BodyEB15),
        ),
        ...viewModel.bids.map(
              (bid) => _buildBidderTile(
            bid.user.nickname,
            '${bid.donation}원',
            bid.content,
          ),
        ),
        const BasicDivider(),
      ],
    );
  }

  Widget _buildBidderTile(String name, String price, String comment) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name $price',
                style: AnbdTextStyle.Body14,
              ),
              Row(
                children: [
                  Text(
                    '“$comment”',
                    style: AnbdTextStyle.Body14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
