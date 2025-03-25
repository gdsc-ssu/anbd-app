import 'package:flutter/material.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';

class TopImage extends StatelessWidget {
  final SharePostResponse product;

  const TopImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.images.isNotEmpty
        ? product.images.first
        : "assets/images/placeholder.png";

    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: SizedBox(
        height: 390,
        width: double.infinity,
        child: imageUrl.startsWith("http")
            ? Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              "assets/images/placeholder.png",
              fit: BoxFit.cover,
            );
          },
        )
            : Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
