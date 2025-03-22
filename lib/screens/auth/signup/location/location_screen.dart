import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/auth/signup/location/location_view_model.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  // initState()는 StatelessWidget에서 사용할 수 없습니다. 제거하거나 StatefulWidget으로 전환해야 합니다.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 500,
          leading: Builder(
            builder: (context) {
              // 상단 동네 검색 text field
              return SearchTextField(
                hintText: '동명(읍, 면) 검색',
                onBackPressed: () {
                  Navigator.pop(context);
                },
                onSearchChanged: (String value) {},
                // 엔터 제출 시, Provider의 searchLocation 호출
                onSubmitted: (String value) {
                  Provider.of<LocationViewModel>(context, listen: false)
                      .searchLocation(value);
                },
              );
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Consumer<LocationViewModel>(
              builder: (context, viewModel, child) {
                final displayText = viewModel.currentSearchTerm.isEmpty
                    ? "근처 동네"
                    : "'${viewModel.currentSearchTerm}' 검색 결과";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicButton(
                      text: '현재위치로 찾기',
                      isClickable: true,
                      onPressed: () {
                        // 권한 요청 후 위치 가져오기
                        viewModel.getGeoData();
                      },
                      size: BasicButtonSize.SMALL,
                    ),
                    const SizedBox(height: 20),

                    // 검색어 표시
                    Text(
                      displayText,
                      style: AnbdTextStyle.BodySB15,
                    ),
                    const SizedBox(height: 20),

                    // 위도/경도 표시 (디버깅용)
                    if (viewModel.latitude != null &&
                        viewModel.longitude != null)
                      Text(
                        "현재 위치: 위도 ${viewModel.latitude}, 경도 ${viewModel.longitude}",
                        style: AnbdTextStyle.Body14,
                      ),

                    const SizedBox(height: 20),

                    // 예측 결과 리스트
                    Expanded(
                      child: ListView.separated(
                        itemCount: viewModel.predictions.length,
                        separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          color: AnbdColor.systemGray02,
                        ),
                        itemBuilder: (context, index) {
                          final prediction = viewModel.predictions[index];
                          return ListTile(
                            dense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            title: Text(
                              prediction.description ??
                                  "검색 결과가 없어요.\n동네 이름을 다시 확인해주세요!",
                              style: AnbdTextStyle.Body15,
                            ),
                            onTap: () {
                              viewModel.onItemClicked(prediction);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
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
