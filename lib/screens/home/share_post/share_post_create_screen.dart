import 'dart:io';
import 'package:anbd/constants/colors.dart';
import 'package:anbd/constants/constants.dart';
import 'package:anbd/constants/style.dart';
import 'package:anbd/widgets/basic_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'share_post_create_view_model.dart';

class SharePostCreateScreen extends StatelessWidget {
  const SharePostCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SharePostCreateViewModel(),
      child: Consumer<SharePostCreateViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                '나눔 글쓰기',
                style: AnbdTextStyle.BodySB18,
              ),
              leading: IconButton(
                icon: SvgPicture.asset("assets/svg/close.svg"),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                TextButton(
                  onPressed: () => viewModel.submitPost(),
                  child: const Text('완료', style: AnbdTextStyle.BodyM16),
                ),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(height: 1, color: AnbdColor.systemGray02),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final result = await context
                              .push<List<File>>(Paths.sharePostImageSelect);
                          if (result != null) {
                            viewModel.addImages(result);
                          }
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/camera_icon.svg',
                                  width: 25,
                                  height: 25,
                                ),
                                Text(
                                  '${viewModel.images.length}/10',
                                  style: AnbdTextStyle.BodyL12.copyWith(
                                    color: AnbdColor.systemGray04,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 80,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.images.length,
                            itemBuilder: (context, index) {
                              final image = viewModel.images[index];
                              return Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(image,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover),
                                  ),
                                  if (index == 0)
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width: 80, // ✅ 이미지 크기와 동일하게
                                        alignment:
                                            Alignment.center, // ✅ 텍스트 가운데 정렬
                                        decoration: const BoxDecoration(
                                          color: AnbdColor.systemGray05,
                                          borderRadius: BorderRadius.only(
                                            // ✅ 아래쪽만 둥글게
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Text(
                                          '대표 사진',
                                          style: AnbdTextStyle.BodyL12.copyWith(
                                              color: AnbdColor.white),
                                        ),
                                      ),
                                    ),
                                  Positioned(
                                    top: 4,
                                    right: 4,
                                    child: GestureDetector(
                                      onTap: () => viewModel.removeImage(index),
                                      child: SvgPicture.asset(
                                          'assets/svg/baseline_close.svg'),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text("제목", style: AnbdTextStyle.BodySB15),
                  const SizedBox(height: 15),
                  BasicTextField(
                    controller: viewModel.titleController,
                    hintText: '글 제목',
                  ),
                  const SizedBox(height: 30),
                  const Text("자세한 설명", style: AnbdTextStyle.BodySB15),
                  const SizedBox(height: 15),
                  BasicTextField(
                    controller: viewModel.contentController,
                    hintText: '나눔글 내용을 작성해 주세요.',
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }
}
