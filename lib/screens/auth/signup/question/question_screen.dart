import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/basic_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/auth/signup/question/question_viewmodel.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  DateTime? tempPickedDate; // 바텀시트에서 임시로 선택되는 날짜
  DateTime _selectedDate = DateTime.now(); // 내부적으로 기억하는 현재 날짜

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // 상단 영역
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 50),
                    child: Consumer<QuestionViewModel>(
                      builder: (context, viewModel, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "안녕하세요 ${viewModel.name}님!",
                              style: AnbdTextStyle.TitleSB18,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "ANBD를 시작하기 전 몇가지 질문을 드릴게요",
                              style: AnbdTextStyle.TitleSB18,
                            ),
                            const SizedBox(height: 30),
                            _buildGenderSelection(context, viewModel),
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

              // 하단 '다음' 버튼
              Consumer<QuestionViewModel>(
                builder: (context, viewModel, child) {
                  return viewModel.isNextButtonVisible
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: BasicButton(
                            text: "다음",
                            isClickable: true,
                            onPressed: () {
                              viewModel.saveUserInfo(viewModel.selectedGender,
                                  viewModel.ageController.text);
                              context.push(Paths.location);
                            },
                          ),
                        )
                      : const SizedBox(); // 버튼 숨기기
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 성별 선택 위젯
  Widget _buildGenderSelection(
      BuildContext context, QuestionViewModel viewModel) {
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

  /// 나이(생년월일) 입력 위젯
  Widget _buildAgeInput(BuildContext context, QuestionViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text("연령대는 어떻게 되시나요?", style: AnbdTextStyle.Body14),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            _showDatePicker(context, viewModel);
          },

          /// 생년월일 입력받는 박스
          child: TextFormField(
            enabled: false,
            controller: viewModel.ageController,
            style: AnbdTextStyle.Body14,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              constraints: BoxConstraints(minHeight: 40),
            ),
          ),
        ),
      ],
    );
  }

  /// 날짜 선택 바텀시트
  Future<void> _showDatePicker(
      BuildContext context, QuestionViewModel viewModel) async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          child: Column(
            children: <Widget>[
              /// 상단 취소/완료 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    child: const Text(
                      '취소',
                      style: AnbdTextStyle.Body15,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  CupertinoButton(
                    child: const Text(
                      '완료',
                      style: AnbdTextStyle.Body15,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(tempPickedDate);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  minimumYear: 1900,
                  maximumYear: DateTime.now().year,
                  initialDateTime: DateTime.now(),
                  maximumDate: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime dateTime) {
                    tempPickedDate = dateTime;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    /// 완료 버튼으로 날짜가 선택된 경우
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
      // ViewModel에 날짜 설정(-> 내부적으로 TextField도 업데이트)
      viewModel.setDate(pickedDate);
    }
  }
}
