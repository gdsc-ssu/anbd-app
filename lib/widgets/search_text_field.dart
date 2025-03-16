import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anbd/constants/constants.dart';

class SearchTextField extends StatefulWidget {
  final VoidCallback onBackPressed;
  final ValueChanged<String> onSearchChanged;
  final String hintText;

  const SearchTextField({
    Key? key,
    required this.onBackPressed,
    required this.onSearchChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  /// 내부에서 텍스트 상태를 관리하기 위한 컨트롤러
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// 입력값 변경 시, 콜백(onSearchChanged)과 setState()로 UI 갱신
    _textController.addListener(() {
      widget.onSearchChanged(_textController.text);
      setState(() {}); // X 아이콘 표시를 위해 상태 업데이트
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          /// ← 뒤로가기 아이콘
          IconButton(
            icon: SvgPicture.asset("assets/svg/chevron_left.svg"),
            onPressed: widget.onBackPressed,
          ),

          /// 검색영역 + 밑줄
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 아이콘 + 텍스트필드 + 닫기(X) 아이콘 (한 줄)
                Row(
                  children: [
                    /// 돋보기 아이콘
                    SvgPicture.asset('assets/svg/search.svg'),

                    const SizedBox(width: 8),

                    /// 텍스트 필드
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        style: AnbdTextStyle.BodyM16,
                        decoration: InputDecoration(
                          hintText: widget.hintText,
                          hintStyle: AnbdTextStyle.BodyM16.copyWith(
                            color: AnbdColor.systemGray03,
                          ),
                          border: InputBorder.none, // 밑줄 제거
                        ),
                      ),
                    ),

                    /// X 아이콘 (텍스트가 비어있지 않을 때만 표시)
                    if (_textController.text.isNotEmpty)
                      IconButton(
                        icon: SvgPicture.asset('assets/svg/close.svg'),
                        onPressed: () {
                          _textController.clear();
                          // clear() 후, Listener가 작동해 setState() 및 onSearchChanged("") 호출
                        },
                      ),
                  ],
                ),

                /// 검색 부분만 밑줄
                Container(
                  height: 1,
                  color: AnbdColor.systemGray02,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
