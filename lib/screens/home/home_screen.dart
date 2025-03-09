import 'package:flutter/material.dart';
import 'package:anbd/screens/home/home_viewmodel.dart';
import 'package:anbd/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:anbd/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 2),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Consumer<HomeViewModel>(
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
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0), // Divider 높이 설정
            child: Container(
              color: AnbdColor.systemGray02,
              height: 1.0,
            ),
          ),
        ),
      ),


      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.currentScreen;
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

