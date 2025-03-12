import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anbd/constants/constants.dart';

class OnboardingInfo {
  OnboardingInfo({
    required this.contentSpans,
    required this.image});

  final List<TextSpan> contentSpans;
  final String image;
}

class OnboardingItems {
  static String basePath = "assets/images/onboarding";

  static final List<OnboardingInfo> items = [
    OnboardingInfo(
      contentSpans: [
        const TextSpan(text: "무심코 버리려던 물건들이\n 해양과 환경에 악영향을 끼치고 있다는\n사실을 아시나요?", style: TextStyle(color: Colors.black, fontFamily: 'PretendardMedium'))
      ],
        image: "$basePath/onboarding1.png"
    ),

    OnboardingInfo(
        contentSpans: [
          const TextSpan(text: "버리는 대신, ANBD에 업로드해서\n새 주인을 찾아줄 수 있어요", style: TextStyle(color: Colors.black, fontFamily: 'PretendardMedium'))
        ],
        image: "$basePath/onboarding2.png"),

    OnboardingInfo(
        contentSpans: [
           const TextSpan(text: "ANBD에서는 내가 가지고 있는 물건을\n이웃에게 ", style: TextStyle(color: Colors.black, fontFamily: 'PretendardMedium')),
          const TextSpan(text: "무료나눔", style: TextStyle(color: AnbdColor.blue, fontFamily: 'PretendardMedium')),
          const TextSpan(text: "하고", style: TextStyle(color: Colors.black, fontFamily: 'PretendardMedium')),
        ],
        image: "$basePath/onboarding3.png"),

    OnboardingInfo(
        contentSpans: [
          const TextSpan(text: "나눔한 금액을 내 이름으로\n환경을 위해 ", style: TextStyle(color: Colors.black, fontFamily: 'PretendardMedium')),
          const TextSpan(text: "기부", style: TextStyle(color: AnbdColor.blue, fontFamily: 'PretendardMedium')),
          const TextSpan(text: "할 수 있어요", style: TextStyle(color: Colors.black, fontFamily: 'PretendardMedium')),
        ],
        image: "$basePath/onboarding4.png"),

    OnboardingInfo(
        contentSpans: [
          const TextSpan(text: "ANBD를 통해 이웃과 정을 나누고\n환경을 지켜요", style: TextStyle(color: Colors.black, fontFamily: 'PretendardMedium'))
        ],
        image: "$basePath/onboarding5.png"),
  ];
}