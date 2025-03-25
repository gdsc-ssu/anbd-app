import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageSelectViewModel extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  List<AssetEntity> _assets = [];
  List<AssetEntity> _selectedAssets = [];

  List<AssetEntity> get assets => _assets;
  List<AssetEntity> get selectedAssets => _selectedAssets;

  ImageSelectViewModel() {
    _fetchAssets();
  }

  Future<void> _fetchAssets() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!ps.isAuth) return;

    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );

    final List<AssetEntity> media =
        await albums.first.getAssetListPaged(page: 0, size: 100);
    _assets = media;
    notifyListeners();
  }

  void toggleSelection(AssetEntity asset) {
    if (_selectedAssets.contains(asset)) {
      _selectedAssets.remove(asset);
    } else {
      if (_selectedAssets.length < 10) {
        _selectedAssets.add(asset);
      }
    }
    notifyListeners();
  }

  int getSelectedIndex(AssetEntity asset) {
    return _selectedAssets.indexOf(asset) + 1;
  }

  /// 카메라 촬영 후 이미지 리스트에 추가
  Future<void> pickFromCamera(BuildContext context) async {
    final XFile? cameraImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (cameraImage != null) {
      Navigator.pop(context, [File(cameraImage.path)]);
    }
  }
}
