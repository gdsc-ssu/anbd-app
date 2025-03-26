import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:anbd/data/dto/request/bid_request.dart';
import 'package:anbd/data/service/share_post_service.dart';
import 'package:flutter_config/flutter_config.dart';


class BidBottomSheet extends StatefulWidget {
  final int postId;
  final String type;
  final VoidCallback onBidCompleted; // ✅ 콜백 추가

  const BidBottomSheet({super.key, required this.postId, required this.onBidCompleted, required this.type});

  @override
  _BidBottomSheetState createState() => _BidBottomSheetState();
}

class _BidBottomSheetState extends State<BidBottomSheet> {
  final TextEditingController _bidController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  bool isBidButtonEnabled = false;

  @override
  void dispose() {
    _bidController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      isBidButtonEnabled =
          _bidController.text.isNotEmpty && _commentController.text.isNotEmpty;
    });
  }

  void _submitBid() async {
    final donation = int.tryParse(_bidController.text) ?? 0;
    final comment = _commentController.text;

    final bidRequest = BidRequest(content: comment, donation: donation);
    final service = SharePostService(token: FlutterConfig.get('master_access_token'));

    try {
      await service.postBid(
        postId: widget.postId,
        bidRequest: bidRequest,
      );

      // 성공 시
      widget.onBidCompleted();

      ScaffoldMessenger.of(context).showSnackBar(
        BlueSnackBar(text: "나눔 신청이 완료되었습니다!"),
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });

      setState(() {
        isBidButtonEnabled = false;
      });
    } catch (e) {
      print("❌ 나눔 신청 실패: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        BlueSnackBar(text: "신청에 실패했습니다. 다시 시도해주세요."),
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context); // ❗ 실패했을 때도 닫기
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(width: 40, height: 4, color: Colors.black45),
            ),
            const SizedBox(height: 16),
            const Text("기부하실 금액을 선정해주세요", style: AnbdTextStyle.TitleSB18),
            const SizedBox(height: 8),

            BasicTextField(
              controller: _bidController,
              hintText: "기부하실 금액을 선정해주세요",
              onChanged: (value) => _onTextChanged(),
            ),

            const SizedBox(height: 20),
            const Text("코멘트를 남겨주세요", style: AnbdTextStyle.TitleSB18),
            const SizedBox(height: 8),

            BasicTextField(
              controller: _commentController,
              hintText: "코멘트를 입력하세요",
              onChanged: (value) => _onTextChanged(),
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                ResetButton(
                  onPressed: () {
                    setState(() {
                      _bidController.clear();
                      _commentController.clear();
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
      ),
    );
  }
}
