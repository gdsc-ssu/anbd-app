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
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 2),
            child: viewModel.currentIndex == 0
                ? _buildHomeAppBar(viewModel)
                : _buildSimpleAppBar(viewModel),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await viewModel.refresh();
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
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.updateIndex,
          ),
        );
      },
    );
  }

  // ✅ 홈 화면 전용 AppBar
  AppBar _buildHomeAppBar(HomeViewModel viewModel) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          viewModel.currentLocation,
          style: AnbdTextStyle.TitleSB18,
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
    );
  }

  // ✅ 동네생활, 채팅, 마이페이지용 AppBar
  AppBar _buildSimpleAppBar(HomeViewModel viewModel) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          viewModel.currentAppBarTitle,
          style: AnbdTextStyle.TitleSB18,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AnbdColor.systemGray02,
          height: 1.0,
        ),
      ),
    );
  }
}
