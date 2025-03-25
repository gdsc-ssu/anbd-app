import 'package:anbd/widgets/floating_compose_button.dart';
import 'package:flutter/material.dart';
import 'package:anbd/screens/home/home_viewmodel.dart';
import 'package:anbd/widgets/custom_bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';
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
            alignment: Alignment.centerLeft,
            child: Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return Text(
                  viewModel.currentLocation,
                  style: AnbdTextStyle.TitleSB18,
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
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return RefreshIndicator(
            onRefresh: () async {
              await viewModel.refresh(); // ⬅️ 여기에 새로고침 로직
            },
            child: Stack(
              children: [
                viewModel.currentScreen,
                if (viewModel.currentIndex == 0)
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: FloatingComposeButton(
                      onPressed: () {
                        context.push(Paths.sharePost);
                      },
                    ),
                  ),
              ],
            ),
          );
        },
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
