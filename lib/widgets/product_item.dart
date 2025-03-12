import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // ✅ 이미지와 제목 시작 위치 맞추기
            children: [
              // ✅ 이미지 영역
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
                    // ✅ 제목과 "무료나눔"을 같은 Row에 배치
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible( // ✅ 제목이 길어지면 자연스럽게 줄어들도록 설정
                          child: Text(
                            product.title,
                            style: AnbdTextStyle.Body16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (product.isFree)
                          Padding(
                            padding: const EdgeInsets.only(left: 8), // ✅ 제목과 "무료나눔" 간격 조정
                            child: Text(
                              "무료나눔",
                              style: AnbdTextStyle.BodyL12.copyWith(color: Colors.blue),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${product.location} · ${product.timeAgo}",
                      style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/heart_off.svg",
                              width: 14,
                              height: 14,
                              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${product.likes}",
                              style: AnbdTextStyle.BodyL12.copyWith(color: AnbdColor.systemGray04),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const Divider(
          thickness: 1,
          height: 1,
          color: AnbdColor.systemGray02,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}
