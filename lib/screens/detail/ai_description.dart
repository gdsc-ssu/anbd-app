import 'package:flutter/material.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/constants/style.dart';
import 'package:anbd/widgets/widgets.dart';

class Description extends StatelessWidget {
  final SharePostResponse product;
  const Description({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'AI 추천 사용 아이디어',
                style: AnbdTextStyle.BodyEB15,
              ),
              const SizedBox(height: 16),
              Text(
                product.description ?? '설명이 없습니다.',
                style: AnbdTextStyle.Body14,
              ),
            ],
          ),
        ),
        const BasicDivider(),
      ],
    );
  }
}
