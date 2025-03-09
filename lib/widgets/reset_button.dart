import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ResetButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      height: 38,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AnbdColor.white,
          foregroundColor: AnbdColor.systemGray04,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color: AnbdColor.systemGray05,
              width: 0.5,
            ),
          ),
          textStyle: AnbdTextStyle.BodyEB15,
        ),
        child: const Text("초기화"),
      ),
    );
  }
}
