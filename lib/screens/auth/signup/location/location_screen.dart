import 'package:anbd/constants/constants.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anbd/screens/auth/signup/location/location_view_model.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 500,
          leading: Builder(
            builder: (context) {
              /// 상단 동네 검색 text field
              return SearchTextField(
                hintText: '동명(읍, 면)으로 검색',
                onBackPressed: () {
                  Navigator.pop(context);
                },
                onSearchChanged: (_) {},
                onSubmitted: (value) {
                  Provider.of<LocationViewModel>(context, listen: false)
                      .searchLocation(value);
                },
              );
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Consumer<LocationViewModel>(
              builder: (context, viewModel, _) {
                final displayText = viewModel.isFromLocation
                    ? "근처 동네"
                    : "'${viewModel.currentSearchTerm}' 검색 결과";

                final items = viewModel.nearbyDistricts;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicButton(
                      text: '현재위치로 찾기',
                      isClickable: true,
                      onPressed: () {
                        viewModel.getGeoData();
                      },
                      size: BasicButtonSize.SMALL,
                    ),
                    const SizedBox(height: 20),
                    Text(displayText, style: AnbdTextStyle.BodySB15),
                    const SizedBox(height: 20),

                    /// 근처 동네 검색 결과
                    Expanded(
                      child: ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const Divider(
                          height: 1,
                          color: AnbdColor.systemGray02,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            dense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            title: Text(
                              items[index],
                              style: AnbdTextStyle.Body15,
                            ),
                            onTap: () {},
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
}
