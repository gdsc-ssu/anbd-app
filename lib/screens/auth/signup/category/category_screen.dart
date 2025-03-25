import 'package:anbd/constants/constants.dart';
import 'package:anbd/screens/auth/signup/category/category_view_model.dart';
import 'package:anbd/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                    Text(
                      "마지막 단계에요!\nAI 추천을 위해 ${viewModel.name ?? '사용자'}님의 \n관심사를 선택해주세요",
                      style: AnbdTextStyle.TitleSB18,
                    ),
                    const SizedBox(height: 20),

                    // GridView
                    Expanded(
                      child: GridView.builder(
                        itemCount: viewModel.categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final category = viewModel.categories[index];
                          final isSelected = viewModel.selectedCategoryKeys
                              .contains(category.categoryKey);

                          return InkWell(
                            onTap: () {
                              viewModel.toggleCategory(category.categoryKey);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                category.icon,
                                const SizedBox(height: 8),
                                Text(
                                  category.label,
                                  style: AnbdTextStyle.BodySB15.copyWith(
                                    color: isSelected
                                        ? AnbdColor.blue
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (viewModel.selectedCategoryKeys.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: BasicButton(
                          text: "선택 완료",
                          isClickable: true,
                          onPressed: () {
                            viewModel.selectCategoryComplete(context);
                            context.push(Paths.home);
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
