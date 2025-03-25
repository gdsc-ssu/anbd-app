import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class SharePostCreateViewModel extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  List<File> _images = [];
  List<File> get images => _images;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  bool get isPostValid =>
      titleController.text.isNotEmpty && contentController.text.isNotEmpty;

  void setImages(List<File> newImages) {
    _images = newImages;
    notifyListeners();
  }

  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

  Future<void> submitPost() async {
    log("\u2705 나눔글 업로드 시작");
    log("\uC81C\uBAA9: \${titleController.text}");
    log("\uB0B4\uC6A9: \${contentController.text}");
    log("\uC774\uBBF8\uC9C0 \uC218: \${_images.length}");
  }

  void addAssets(List<AssetEntity> assets) async {
    _images.clear(); // 기존 이미지 초기화할지 여부는 상황에 따라 결정
    for (final asset in assets) {
      final file = await asset.file;
      if (file != null) {
        _images.add(file);
      }
    }
    notifyListeners();
  }

  void addImages(List<File> newImages) {
    final availableSlots = 10 - _images.length;
    _images.addAll(newImages.take(availableSlots));
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
