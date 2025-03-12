import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/search_text_field.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text('근처 동네', style: AnbdTextStyle.BodySB15),

                const SizedBox(height: 20),

                /// 📌 검색 결과 리스트
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
}
