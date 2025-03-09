import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final bool isClickable;
  final VoidCallback? onPressed;

  const BasicButton({
    super.key,
    required this.text,
    required this.isClickable,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isClickable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isClickable ? AnbdColor.blue : AnbdColor.systemGray03,
          foregroundColor: AnbdColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle: AnbdTextStyle.TitleSB18,
        ),
        child: Text(text),
      ),
    );
  }
}
