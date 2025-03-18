import 'package:anbd/constants/colors.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// 🔹 약관 데이터 모델
class _Term {
  final String title;
  final bool isRequired;
  bool agreed;

  _Term({
    required this.title,
    required this.isRequired,
    this.agreed = false,
  });
}

class TermsBottomSheet extends StatefulWidget {
  const TermsBottomSheet({Key? key}) : super(key: key);

  @override
  _TermsBottomSheetState createState() => _TermsBottomSheetState();
}

class _TermsBottomSheetState extends State<TermsBottomSheet> {
  bool _allAgree = false;

  // 약관 목록
  final List<_Term> _terms = [
    _Term(title: "(필수) ANBD 약관 및 동의사항", isRequired: true),
    _Term(title: "(필수) 서비스 이용약관", isRequired: true),
    _Term(title: "(필수) 개인정보 수집 및 이용", isRequired: true),
    _Term(title: "(필수) 위치정보 수집 및 이용", isRequired: true),
    _Term(title: "(선택) 마케팅 정보 수신 동의", isRequired: false),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final sheetHeight = screenHeight * 0.4;

    bool isAllRequiredAgreed =
        _terms.where((t) => t.isRequired).every((term) => term.agreed);

    return SizedBox(
      height: sheetHeight,
      child: Column(
        children: [
          /// 상단 드래그 인디케이터
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            decoration: BoxDecoration(
              color: AnbdColor.systemGray03,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // 모두 동의
          _buildAllAgreeTile(),

          const Divider(color: AnbdColor.systemGray02, thickness: 1),

          /// 약관 목록
          Expanded(
            child: ListView.builder(
              itemCount: _terms.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildTermTile(_terms[index]),
                );
              },
            ),
          ),

          /// 시작하기 버튼
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: BasicButton(
              text: '시작하기',
              isClickable: isAllRequiredAgreed,
              onPressed: _onStartPressed,
            ),
          ),
        ],
      ),
    );
  }

  /// "모두 동의" 영역
  Widget _buildAllAgreeTile() {
    return ListTile(
      horizontalTitleGap: 2,
      leading: GestureDetector(
        onTap: () {
          setState(() {
            _allAgree = !_allAgree;
            for (final term in _terms) {
              term.agreed = _allAgree;
            }
          });
        },
        child: SvgPicture.asset(
          _allAgree ? 'assets/svg/check.svg' : 'assets/svg/check_off.svg',
        ),
      ),
      title: const Text(
        "모두 동의",
        style: AnbdTextStyle.BodySB15,
      ),
      onTap: () {
        setState(() {
          _allAgree = !_allAgree;
          for (final term in _terms) {
            term.agreed = _allAgree;
          }
        });
      },
    );
  }

  /// 개별 약관 타일
  Widget _buildTermTile(_Term term) {
    return InkWell(
      onTap: () {
        setState(() {
          term.agreed = !term.agreed;
          _checkAllAgreeStatus();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 체크 아이콘
            GestureDetector(
              onTap: () {
                setState(() {
                  term.agreed = !term.agreed;
                  _checkAllAgreeStatus();
                });
              },
              child: SvgPicture.asset(
                term.agreed
                    ? 'assets/svg/check_blue.svg'
                    : 'assets/svg/check_gray.svg',
              ),
            ),
            const SizedBox(width: 10),
            // 텍스트
            Expanded(
              child: Text(
                term.title,
                style: AnbdTextStyle.BodyL12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 전체 동의 여부 재확인
  void _checkAllAgreeStatus() {
    final areAllChecked = _terms.every((term) => term.agreed == true);
    _allAgree = areAllChecked;
  }

  /// "시작하기" 버튼 눌렀을 때 (필수 약관 체크 여부 확인)
  void _onStartPressed() {
    context.push(Paths.category);
  }
}
