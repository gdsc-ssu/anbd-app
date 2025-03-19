import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';

class BidBottomSheet extends StatefulWidget {
  final VoidCallback onBidCompleted; // ✅ 콜백 추가

  const BidBottomSheet({super.key, required this.onBidCompleted});

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

  void _submitBid() {
    if (isBidButtonEnabled) {
      setState(() {
        isBidButtonEnabled = false; // ✅ 버튼 비활성화
      });

      // ✅ 스낵바 표시
      ScaffoldMessenger.of(context).showSnackBar(
        BlueSnackBar(text: "입찰이 완료되었습니다!"),
      );

      // ✅ 500ms 후 BottomSheet 닫기
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });

      // ✅ 부모 위젯에 입찰 완료 상태 전달
      widget.onBidCompleted();
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
          Center(
            child: Container(width: 40, height: 4, color: Colors.black45),
          ),
          const SizedBox(height: 16),
          const Text("입찰 금액을 입력하세요", style: AnbdTextStyle.TitleSB18),
          const SizedBox(height: 8),

          BasicTextField(
            controller: _bidController,
            hintText: "입찰 금액을 입력하세요",
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
                  text: isBidButtonEnabled ? "입찰하기" : "입찰 완료",
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
