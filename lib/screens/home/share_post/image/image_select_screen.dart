import 'dart:io';
import 'dart:typed_data';
import 'package:anbd/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_manager/photo_manager.dart';
import 'image_select_view_model.dart';

class ImageSelectScreen extends StatelessWidget {
  const ImageSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageSelectViewModel(),
      child: Consumer<ImageSelectViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                '최근 항목',
                style: AnbdTextStyle.BodySB18,
              ),
              leading: IconButton(
                icon: SvgPicture.asset("assets/svg/close.svg"),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    final files = await Future.wait(
                      viewModel.selectedAssets.map((asset) => asset.file),
                    );
                    Navigator.pop(context, files.whereType<File>().toList());
                  },
                  child: Text(
                    '${viewModel.selectedAssets.length} 완료',
                    style: AnbdTextStyle.BodyM16.copyWith(
                      color: AnbdColor.blue,
                    ),
                  ),
                ),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  height: 1,
                  color: AnbdColor.systemGray02,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: viewModel.assets.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () => viewModel.pickFromCamera(context),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/camera_icon.svg",
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(height: 8),
                            const Text("사진 찍기", style: AnbdTextStyle.Body16),
                          ],
                        ),
                      ),
                    );
                  }

                  final asset = viewModel.assets[index - 1];
                  final isSelected = viewModel.selectedAssets.contains(asset);
                  final selectedIndex = viewModel.getSelectedIndex(asset);

                  return FutureBuilder<Uint8List?>(
                    future: asset.thumbnailDataWithSize(
                      const ThumbnailSize(200, 200),
                    ),
                    builder: (context, snapshot) {
                      final bytes = snapshot.data;
                      if (bytes == null) return const SizedBox();

                      return GestureDetector(
                        onTap: () => viewModel.toggleSelection(asset),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                child: Image.memory(
                                  bytes,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Positioned(
                                top: 4,
                                right: 4,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AnbdColor.blue,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$selectedIndex',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (isSelected)
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AnbdColor.blue,
                                    width: 3,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }
}
