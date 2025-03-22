import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Prediction {
  final String? description;
  final String? placeId;
  double? lat;
  double? lng;

  Prediction({
    required this.description,
    required this.placeId,
    this.lat,
    this.lng,
  });
}

class LocationViewModel extends ChangeNotifier {
  final String googleApiKey = FlutterConfig.get("google_api_key");
  late GoogleMapsPlaces _places;

  // 검색 결과 예측 목록
  List<Prediction> predictions = [];
  Prediction? _selectedPrediction;
  Prediction? get selectedPrediction => _selectedPrediction;

  // 현재 검색어
  String currentSearchTerm = "";

  // 위도/경도 (String으로 관리)
  String? latitude;
  String? longitude;

  LocationViewModel() {
    _places = GoogleMapsPlaces(apiKey: googleApiKey);
  }

  /// 검색어에 맞춰 장소 예측 목록 가져오기
  Future<void> searchLocation(String query) async {
    currentSearchTerm = query;
    notifyListeners();

    if (query.isEmpty) {
      predictions = [];
      notifyListeners();
      return;
    }

    final response = await _places.autocomplete(
      query,
      language: "ko",
      components: [Component("country", "kr")],
    );

    if (response.isOkay) {
      predictions = response.predictions
          .map((p) => Prediction(
                description: p.description ?? "",
                placeId: p.placeId,
              ))
          .toList();
      notifyListeners();
    } else {
      log("Autocomplete Error: ${response.errorMessage}");
    }
  }

  /// 위치 권한 요청 후, 위치 정보 가져오기
  Future<void> getGeoData() async {
    // 위치 서비스 활성화 여부 확인
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('위치 서비스가 꺼져 있습니다.');
      return;
    }

    // 권한 확인 및 요청 (필요시 자동으로 시스템 다이얼로그 뜸)
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) {
        log('위치 권한이 거부되었습니다.');
        return;
      }
    }

    // 위치 가져오기
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    latitude = position.latitude.toString();
    longitude = position.longitude.toString();

    log("위도: $latitude, 경도: $longitude");
    notifyListeners();
  }

  /// 권한 요청
  Future<void> permission(BuildContext context) async {
    var requestStatus = await Permission.location.request();
    var status = await Permission.location.status;

    if (status.isGranted) {
      // 권한이 허용되었으면 위치 가져오기
      await getGeoData();
    } else if (status.isLimited) {
      // 제한적 허용 (iOS)
      await getGeoData();
    } else if (status.isPermanentlyDenied) {
      log("isPermanentlyDenied");
      // 앱 설정으로 이동
      openAppSettings();
    } else if (status.isRestricted) {
      log("isRestricted");
      openAppSettings();
    } else if (status.isDenied) {
      log("isDenied");
    }

    log("requestStatus: ${requestStatus.name}");
    log("status: ${status.name}");
  }

  /// 리스트 항목 탭 시 호출
  void onItemClicked(Prediction prediction) {
    _selectedPrediction = prediction;
    notifyListeners();
  }

  @override
  void dispose() {
    _places.dispose();
    super.dispose();
  }
}
