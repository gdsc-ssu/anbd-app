import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';

SnackBar BlueSnackBar({required String text}) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: AnbdTextStyle.BodyEB15.copyWith(color: AnbdColor.white),
    ),
    backgroundColor: AnbdColor.blue,
    duration: const Duration(seconds: 3),
  );
}
