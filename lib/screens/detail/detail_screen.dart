import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String productId; // ✅ 제품 ID 추가

  const DetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상품 상세 페이지")),
      body: Center(
        child: Text(
          "제품 ID: $productId",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}