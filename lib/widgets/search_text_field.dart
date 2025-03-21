import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anbd/constants/constants.dart';

class SearchTextField extends StatefulWidget {
  final VoidCallback onBackPressed;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onSubmitted;
  final String hintText;

  const SearchTextField({
    Key? key,
    required this.onBackPressed,
    required this.onSearchChanged,
    required this.onSubmitted,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// 텍스트가 변경될 때마다 onSearchChanged 콜백 호출
    _textController.addListener(() {
      widget.onSearchChanged(_textController.text);
      setState(() {});
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
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset("assets/svg/chevron_left.svg"),
            onPressed: widget.onBackPressed,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 아이콘, 텍스트필드, 닫기(X) 아이콘을 한 줄로 배치
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/search.svg'),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        style: AnbdTextStyle.BodyM16,
                        decoration: InputDecoration(
                          hintText: widget.hintText,
                          hintStyle: AnbdTextStyle.BodyM16.copyWith(
                            color: AnbdColor.systemGray03,
                          ),
                          border: InputBorder.none,
                        ),
                        onSubmitted: widget.onSubmitted,
                      ),
                    ),
                    if (_textController.text.isNotEmpty)
                      IconButton(
                        icon: SvgPicture.asset('assets/svg/close.svg'),
                        onPressed: () {
                          _textController.clear();
                        },
                      ),
                  ],
                ),
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
