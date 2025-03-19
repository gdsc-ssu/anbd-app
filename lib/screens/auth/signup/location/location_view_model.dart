import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_maps_webservices/places.dart';

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

  // 현재 검색어를 보관하는 변수. 빈 문자열이면 기본값을 표시할 예정.
  String currentSearchTerm = "";

  LocationViewModel() {
    _places = GoogleMapsPlaces(apiKey: googleApiKey);
  }

  /// 엔터 제출 시 호출하여 검색어를 저장하고 API 호출
  Future<void> searchLocation(String query) async {
    // 검색어 업데이트 (빈 문자열이면 기본 텍스트를 유지)
    currentSearchTerm = query;
    notifyListeners();

    if (query.isEmpty) {
      predictions = [];
      notifyListeners();
      return;
    }

    final response = await _places.autocomplete(
      query,
      language: "ko", // 한국어 결과
      components: [Component("country", "kr")], // 특정 국가 제한
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

  /// 선택된 장소의 상세 정보를 가져와 위도/경도 업데이트
  Future<void> getPlaceDetails(String placeId) async {
    final detailResponse = await _places.getDetailsByPlaceId(placeId);
    if (detailResponse.isOkay) {
      final location = detailResponse.result.geometry?.location;
      if (location != null) {
        _selectedPrediction = Prediction(
          description: detailResponse.result.formattedAddress ?? "",
          placeId: placeId,
          lat: location.lat,
          lng: location.lng,
        );
        notifyListeners();
        log("장소 좌표 - Lat: ${location.lat}, Lng: ${location.lng}");
      }
    } else {
      log("Place Details Error: ${detailResponse.errorMessage}");
    }
  }

  /// 리스트 항목 클릭 시 호출
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
