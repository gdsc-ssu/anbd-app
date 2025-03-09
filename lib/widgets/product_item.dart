import 'package:flutter/material.dart';
import 'package:anbd/models/product_model.dart';
import 'package:anbd/constants/constants.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16), // ✅ 간격 추가
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  product.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/placeholder.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${product.location} · ${product.timeAgo}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider( // ✅ 구분선 추가
          thickness: 1,
          height: 1,
          color: AnbdColor.systemGray02, // 색상 조절 가능
          indent: 16, // 왼쪽 여백
          endIndent: 16, // 오른쪽 여백
        ),
      ],
    );
  }
}
