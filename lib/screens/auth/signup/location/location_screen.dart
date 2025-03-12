import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/auth/signup/location/location_view_model.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 500,
          leading: SearchTextField(
            hintText: '동명(읍, 면) 검색',
            onBackPressed: () {
              Navigator.pop(context); // 뒤로가기 동작
            },
            onSearchChanged: (String value) {
              // 검색 로직
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BasicButton(
                  text: '현재위치로 찾기',
                  isClickable: true,
                  onPressed: () {
                    showTermsBottomSheet(context);
                  },
                  size: BasicButtonSize.SMALL,
                ),
                const SizedBox(height: 10),

                const Text('근처 동네', style: AnbdTextStyle.BodySB15),

                const SizedBox(height: 20),

                /// TODO 검색 결과 리스트 api 붙이고 수정
                /* Expanded(
                  child: Consumer<LocationViewModel>(
                    builder: (context, viewModel, child) {
                      //return ListView.builder(

                      //);
                    },
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showTermsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 화면 대부분을 차지하도록
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return const TermsBottomSheet();
      },
    );
  }
}
