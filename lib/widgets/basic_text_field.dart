import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const BasicTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AnbdTextStyle.Body14,
      onChanged: onChanged, // ✅ 추가
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AnbdTextStyle.Body14.copyWith(color: AnbdColor.systemGray03),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: AnbdColor.systemGray05),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: AnbdColor.systemGray05),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: AnbdColor.systemGray05),
        ),
        counterText: '',
      ),
    );
  }
}
