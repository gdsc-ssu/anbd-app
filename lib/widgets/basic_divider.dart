import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';

class BasicDivider extends StatelessWidget {
  const BasicDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AnbdColor.systemGray01,
      height: 0,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}
