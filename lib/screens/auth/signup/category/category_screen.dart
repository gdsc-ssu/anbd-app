import 'package:anbd/constants/constants.dart';
import 'package:anbd/screens/auth/signup/category/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<CategoryViewModel>(
            builder: (context, viewModel, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "마지막 단계에요!\nAI 추천을 위해 {name}님의 \n관심사를 선택해주세요",
                      style: AnbdTextStyle.TitleSB18,
                    ),
                    const SizedBox(height: 20),

                    // GridView
                    Expanded(
                      child: GridView.builder(
                        itemCount: viewModel.categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 한 행에 3개
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final category = viewModel.categories[index];
                          return InkWell(
                            onTap: () {
                              viewModel.selectCategory(
                                  category.categoryKey, context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                category.icon,
                                const SizedBox(height: 8),
                                Text(
                                  category.label,
                                  style: AnbdTextStyle.BodySB15,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
