import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';

enum BasicButtonSize {
  SMALL,
  LARGE,
}

const double _smallheight = 38;
const double _largeheight = 50;

class BasicButton extends StatelessWidget {
  final String text;
  final bool isClickable;
  final VoidCallback? onPressed;
  final BasicButtonSize size;

  const BasicButton({
    super.key,
    required this.text,
    required this.isClickable,
    required this.onPressed,
    this.size = BasicButtonSize.LARGE, //기본값 large
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (size == BasicButtonSize.LARGE) ? _largeheight : _smallheight,
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
