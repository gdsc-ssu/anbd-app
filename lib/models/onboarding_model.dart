class OnboardingInfo {
  OnboardingInfo({
    required this.content,
    required this.image});

  final String content;
  final String image;
}

class OnboardingItems {
  static String basePath = "assets/images/onboarding";

  static final List<OnboardingInfo> items = [
    OnboardingInfo(
        content: "무심코 버리려던 물건들이\n 해양과 환경에 악영향을 끼치고 있다는\n사실을 아시나요?",
        image: "$basePath/onboarding1.png"),

    OnboardingInfo(
        content: "버리는 대신, ANBD에 업로드해서\n새 주인을 찾아줄 수 있어요",
        image: "$basePath/onboarding2.png"),

    OnboardingInfo(
        content: "ANBD에서는 내가 가지고 있는 물건을\n이웃에게 무료나눔 하고",
        image: "$basePath/onboarding3.png"),

    OnboardingInfo(
        content: "나눔한 금액을 내 이름으로\n환경을 위해 기부할 수 있어요",
        image: "$basePath/onboarding4.png"),

    OnboardingInfo(
        content: "ANBD를 통해\n이웃과 정을 나누고 환경을 지켜요",
        image: "$basePath/onboarding5.png"),
  ];
}