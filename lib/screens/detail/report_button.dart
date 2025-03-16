import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportButton extends StatefulWidget {
  const ReportButton({super.key});

  @override
  State<ReportButton> createState() => _ReportButtonState();
}

class _ReportButtonState extends State<ReportButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "이 나눔글 신고하기",
                style: AnbdTextStyle.BodyEB15,
              ),
              SvgPicture.asset(
                  'assets/svg/arrow_right.svg'),
            ],
          ),
        ),
        const BasicDivider(),
      ],
    );
  }
}
