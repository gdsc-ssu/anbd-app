import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';

class UserInfo extends StatelessWidget {
  final SharePostResponse product;
  const UserInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  "assets/images/placeholder.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "감성탐방러",
                    style: AnbdTextStyle.BodyEB15,
                  ),
                  Text(
                    "중랑구 면목동",
                    style: AnbdTextStyle.BodyL12,
                  ),
                ],
              ),
            ],
          ),
        ),
        const BasicDivider(),
      ],
    );;
  }
}

