import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:anbd/models/product_detail_model.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';

class Content extends StatelessWidget {
  final SharePostResponse product;

  const Content({super.key, required this.product});

  String formatTimeAgo(DateTime createdAt) {
    final DateTime createdTime = createdAt.toLocal();
    final Duration diff = DateTime.now().difference(createdTime);

    if (diff.inMinutes < 1) {
      return '방금 전';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}분 전';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}시간 전';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}일 전';
    } else {
      return '${createdTime.year}.${createdTime.month.toString().padLeft(2, '0')}.${createdTime.day.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title ?? '',
                style: AnbdTextStyle.TitleSB18,
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.category ?? '',
                    style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '·',
                    style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    formatTimeAgo(product.createdAt),
                    style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                product.content ?? '',
                style: AnbdTextStyle.Body14,
              ),
              const SizedBox(height: 16),
              Text(
                "관심 ${product.likeCount}",
                style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
              ),
            ],
          ),
        ),
        const BasicDivider(),
      ],
    );
  }
}
