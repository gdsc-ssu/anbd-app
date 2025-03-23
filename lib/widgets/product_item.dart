import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:anbd/models/product_model.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/detail/${product.id}');
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/images/placeholder.png',// 기본 이미지 URL 설정
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              product.title,
                              style: AnbdTextStyle.Body16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // if (product.isFree)
                          //   Padding(
                          //     padding: const EdgeInsets.only(left: 8),
                          //     child: Text(
                          //       "무료나눔",
                          //       style: AnbdTextStyle.BodyL12.copyWith(color: Colors.blue),
                          //     ),
                          //   ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${product.location} · ${product.createdAt}",
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
                                "${product.likeCount}",
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
          const BasicDivider(),
        ],
      ),
    );
  }
}
