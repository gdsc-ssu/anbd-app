import 'package:anbd/widgets/floating_compose_button.dart';
import 'package:flutter/material.dart';
import 'package:anbd/screens/home/home_viewmodel.dart';
import 'package:anbd/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:anbd/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 2),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.centerLeft, // ✅ 동네 이름을 왼쪽 정렬
            child: Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return GestureDetector(
                  onTap: () {
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
                      items: viewModel.locations.map((String location) {
                        return PopupMenuItem<String>(
                          value: location,
                          child: Text(location),
                          onTap: () => viewModel.updateLocation(location),
                        );
                      }).toList(),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        viewModel.currentLocation,
                        style: AnbdTextStyle.TitleSB18,
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.keyboard_arrow_down, size: 20),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/svg/search.svg"),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: AnbdColor.systemGray02,
              height: 1.0,
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          Consumer<HomeViewModel>(
            builder: (context, viewModel, child) {
              return viewModel.currentScreen;
            },
          ),

          // ✅ 홈 화면 (index == 0)일 때만 FloatingComposeButton 표시
          Consumer<HomeViewModel>(
            builder: (context, viewModel, child) {
              return viewModel.currentIndex == 0
                  ? Positioned(
                bottom: 16.0,
                right: 16.0,
                child: FloatingComposeButton(
                  onPressed: () {},
                ),
              )
                  : const SizedBox(); // 다른 화면에서는 아무것도 표시하지 않음
            },
          ),
        ],
      ),

      bottomNavigationBar: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return CustomBottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.updateIndex,
          );
        },
      ),
    );
  }
}
