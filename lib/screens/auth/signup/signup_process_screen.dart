import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/basic_button.dart';
import 'package:anbd/widgets/basic_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/auth/signup/signup_process_viewmodel.dart';

class SignupProcessScreen extends StatelessWidget {
  const SignupProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupProcessViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 50),
                    child: Consumer<SignupProcessViewModel>(
                      builder: (context, viewModel, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "안녕하세요 {name}!",
                              style: AnbdTextStyle.TitleSB18,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "ANBD를 시작하기 전 질문을 드릴게요",
                              style: AnbdTextStyle.TitleSB18,
                            ),
                            const SizedBox(height: 30),

                            /// 성별 선택 UI
                            _buildGenderSelection(context, viewModel),

                            /// 성별이 선택되면 나이 입력 UI 표시
                            if (viewModel.selectedGender != null)
                              _buildAgeInput(context, viewModel),

                            const SizedBox(height: 30),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),

              /// 다음 버튼
              Consumer<SignupProcessViewModel>(
                builder: (context, viewModel, child) {
                  return viewModel.isNextButtonVisible
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: BasicButton(
                            text: "다음",
                            isClickable: true,
                            onPressed: () {
                              /// TODO: 다음 동작 구현
                            },
                          ),
                        )
                      : const SizedBox(); // 버튼이 보이지 않도록 처리
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelection(
      BuildContext context, SignupProcessViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("성별이 어떻게 되시나요?", style: AnbdTextStyle.Body14),
        const SizedBox(height: 10),
        Row(
          children: [
            GestureDetector(
              onTap: () => viewModel.setGender("남성"),
              child: Row(
                children: [
                  SvgPicture.asset(
                    viewModel.selectedGender == "남성"
                        ? 'assets/svg/check.svg'
                        : 'assets/svg/check_off.svg',
                  ),
                  const SizedBox(width: 8),
                  const Text("남성", style: AnbdTextStyle.Body14),
                ],
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => viewModel.setGender("여성"),
              child: Row(
                children: [
                  SvgPicture.asset(
                    viewModel.selectedGender == "여성"
                        ? 'assets/svg/check.svg'
                        : 'assets/svg/check_off.svg',
                  ),
                  const SizedBox(width: 8),
                  const Text("여성", style: AnbdTextStyle.Body14),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAgeInput(
      BuildContext context, SignupProcessViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text("연령대는 어떻게 되시나요?", style: AnbdTextStyle.Body14),
        const SizedBox(height: 10),
        BasicTextField(
          controller: viewModel.ageController,
          hintText: "나이를 입력해주세요.",
        ),
      ],
    );
  }
}
