import 'package:anbd/widgets/basic_divider.dart';
import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BidderList extends StatefulWidget {
  const BidderList({super.key});

  @override
  State<BidderList> createState() => _BidderListState();
}

class _BidderListState extends State<BidderList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "입찰자",
            style: AnbdTextStyle.BodyEB15,
          ),
        ),
        const SizedBox(height: 16),
        _buildBidderTile('장환곤', '10000원', '저 이거 없으면 죽어요'),
        _buildBidderTile('장환곤', '1억', '너무나도 갖고싶습니다'),
        const BasicDivider(),

      ],
    );
  }
}

Widget _buildBidderTile(String name, String price, String comment) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 좌우 정렬 명확히 분리
          children: [
            // 이름과 가격 정보 (왼쪽에 고정)
            Text(
              '$name $price',
              style: AnbdTextStyle.Body14,
            ),
            // 댓글과 화살표 (오른쪽으로 정렬)
            Row(
              children: [
                Text(
                  '“$comment”',
                  style: AnbdTextStyle.Body14,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  "assets/svg/arrow_right.svg",
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AnbdColor.systemGray04,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
