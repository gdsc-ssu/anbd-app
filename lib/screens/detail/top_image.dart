import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  final String imagePath;

  const TopImage({super.key, this.imagePath = "assets/images/placeholder.png"});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      // height: 300, // 필요하면 높이도 파라미터화 가능
    );
  }
}
