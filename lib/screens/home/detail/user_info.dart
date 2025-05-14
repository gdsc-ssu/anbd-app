import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:anbd/data/dto/response/user_profiles_response.dart';

class UserInfo extends StatelessWidget {
  final UserProfilesResponse user;
  const UserInfo({super.key, required this.user});

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
                child: user.profileImage != null
                    ? Image.network(
                  user.profileImage!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  'assets/images/placeholder.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname,
                    style: AnbdTextStyle.BodyEB15,
                  ),
                  Text(
                    user.neighborhood,
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

