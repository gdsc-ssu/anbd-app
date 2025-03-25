import 'dart:developer';
import 'dart:io';
import 'package:anbd/common/enums/share_post_type.dart';
import 'package:anbd/data/service/share_post_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class SharePostCreateViewModel extends ChangeNotifier {
  final SharePostService sharePostService = GetIt.instance<SharePostService>();

  bool get isPostValid =>
      titleController.text.isNotEmpty && contentController.text.isNotEmpty;

  List<File> _images = [];
  List<File> get images => _images;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  SharePostType? _selectedType = null;
  SharePostType? get selectedType => _selectedType;

  void selectType(SharePostType type) {
    _selectedType = type;
    notifyListeners();
  }

  void setImages(List<File> newImages) {
    _images = newImages;
    notifyListeners();
  }

  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

  Future<void> postSharePosts() async {
    await sharePostService.postSharePosts(
      titleController.text,
      contentController.text,
      selectedType!.name,
      images,
    );
  }

  void addAssets(List<AssetEntity> assets) async {
    _images.clear();
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
