import 'package:flutter/material.dart';

class BidBottomSheet extends StatefulWidget {
  final VoidCallback onBidCompleted;

  const BidBottomSheet({super.key, required this.onBidCompleted});

  @override
  _BidBottomSheetState createState() => _BidBottomSheetState();
}

class _BidBottomSheetState extends State<BidBottomSheet> {
  final TextEditingController _bidController = TextEditingController();
  bool isBidButtonEnabled = false;

  @override
  void dispose() {
    _bidController.dispose();
    super.dispose();
  }

  void _onBidAmountChanged(String value) {
    setState(() => isBidButtonEnabled = value.isNotEmpty);
  }

  void _submitBid() {
    widget.onBidCompleted();
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
          const Text("입찰 금액을 선정해주세요", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: _bidController,
            keyboardType: TextInputType.number,
            onChanged: _onBidAmountChanged,
            decoration: const InputDecoration(border: OutlineInputBorder(), suffixText: "원"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: isBidButtonEnabled ? _submitBid : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isBidButtonEnabled ? Colors.black : Colors.grey.shade400,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text("입찰하기", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
