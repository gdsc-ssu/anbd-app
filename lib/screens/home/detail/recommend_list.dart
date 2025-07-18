import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  final List<Map<String, String>> items = const [
    {
      "title": "다 읽은 책 교환",
      "image": "assets/images/items/book.jpeg",
    },
    {
      "title": "옷 나눔",
      "image": "assets/images/items/clothes.jpeg",
    },
    {
      "title": "테이블 기부합니다",
      "image": "assets/images/items/table.jpeg",
    },
    {
      "title": "텀블러 무료 나눔 합니다",
      "image": "assets/images/items/tumbler.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            "이런 제품도 나눔 진행중이에요",
            style: AnbdTextStyle.BodyEB15,
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return _RecommendItem(
              title: item["title"]!,
              imagePath: item["image"]!,
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _RecommendItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const _RecommendItem({
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AnbdTextStyle.Body14,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
