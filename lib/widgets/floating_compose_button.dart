import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingComposeButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const FloatingComposeButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AnbdColor.blue,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      label: Text(
        '글쓰기',
        style: AnbdTextStyle.BodySB15.copyWith(color: AnbdColor.white),
      ),
      icon: SvgPicture.asset(
        'assets/svg/add.svg',
        width: 15,
        height: 15,
      ),
    );
  }
}
