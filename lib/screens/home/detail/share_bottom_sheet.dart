import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:anbd/data/dto/request/bid_request.dart';
import 'package:anbd/data/service/share_post_service.dart';
import 'package:flutter_config/flutter_config.dart';

class DonateBottomSheet extends StatefulWidget {
  final int postId;
  final VoidCallback onBidCompleted;

  const DonateBottomSheet({
    super.key,
    required this.postId,
    required this.onBidCompleted,
  });

  @override
  State<DonateBottomSheet> createState() => _DonateBottomSheetState();
}

class _DonateBottomSheetState extends State<DonateBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  bool isBidButtonEnabled = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      isBidButtonEnabled = _commentController.text.isNotEmpty;
    });
  }

  void _submitBid() async {
    if (!isBidButtonEnabled) return;

    setState(() => isBidButtonEnabled = false);

    final comment = _commentController.text;
    final bidRequest = BidRequest(content: comment, donation: 0); // 기부는 금액이 0

    final service = SharePostService(token: FlutterConfig.get('master_access_token'));

    try {
      await service.postBid(postId: widget.postId, bidRequest: bidRequest);

      widget.onBidCompleted();

      ScaffoldMessenger.of(context).showSnackBar(
        BlueSnackBar(text: "나눔 신청이 완료되었습니다!"),
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        BlueSnackBar(text: "신청에 실패했습니다. 다시 시도해주세요."),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Container(width: 40, height: 4, color: Colors.black45)),
          const SizedBox(height: 16),
          const Text("코멘트를 남겨주세요", style: AnbdTextStyle.TitleSB18),
          const SizedBox(height: 8),
          BasicTextField(
            controller: _commentController,
            hintText: "코멘트를 남겨주세요",
            onChanged: (value) => _onTextChanged(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ResetButton(
                onPressed: () {
                  setState(() {
                    _commentController.clear();
                    isBidButtonEnabled = false;
                  });
                },
              ),
              const SizedBox(width: 12),
              Expanded(
                child: BasicButton(
                  text: isBidButtonEnabled ? "나눔받기" : "신청 완료",
                  isClickable: isBidButtonEnabled,
                  onPressed: isBidButtonEnabled ? _submitBid : null,
                  size: BasicButtonSize.SMALL,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
