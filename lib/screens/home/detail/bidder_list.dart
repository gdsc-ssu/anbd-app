import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/basic_divider.dart';
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
              (bid) =>
              _buildBidderTile(
                context,
                bid.user.nickname,
                '${bid.donation}원',
                bid.content,
              ),
        ),
        const BasicDivider(),
      ],
    );
  }

  Widget _buildBidderTile(BuildContext context, String name, String price,
      String comment) {
    return InkWell(
      onTap: () {
        _showDonationDialog(context, name, comment);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$name $price',
              style: AnbdTextStyle.Body14,
            ),
            Expanded(
              child: Text(
                '“$comment”',
                style: AnbdTextStyle.Body14,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDonationDialog(BuildContext context, String name, String comment) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (_) =>
            CupertinoAlertDialog(
              title: Text("$name님께\n기부하시겠습니까?"),
              content: Text("기부자 메시지 : $comment"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: 기부 처리
                  },
                  child: const Text("기부하기"),
                ),
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("취소"),
                ),
              ],
            ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              title: Text("$name님께\n기부하시겠습니까?"),
              content: Text("기부자 메시지 : $comment"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: 기부 처리
                  },
                  child: const Text("기부하기"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("취소"),
                ),
              ],
            ),
      );
    }
  }
}
