import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import '../data/dto/response/share_post_response.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart' as timeago_ko show ko;

class ProductItem extends StatelessWidget {
  final SharePostResponse product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("🔍 렌더링 중: ${product.title}");
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
                  child: Image.network(
                    product.images.isNotEmpty ? product.images[0] : '',
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
                          if (product.type == "SHARE")
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "무료나눔",
                                style: AnbdTextStyle.BodyL12.copyWith(color: Colors.blue),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${product.location} · ${timeago.format(product.createdAt, locale: 'ko')}",
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
