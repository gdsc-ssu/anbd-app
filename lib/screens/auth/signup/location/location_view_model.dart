import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geolocator/geolocator.dart';

class LocationViewModel extends ChangeNotifier {
  final String googleApiKey = FlutterConfig.get("google_api_key");
  late GoogleMapsPlaces _places;

  /// 근처 동네 검색 결과 리트
  List<String> nearbyDistricts = [];

  /// 현재위치로 찾기인지 검색어로 찾기인지
  bool isFromLocation = true;

  /// 현재 검색어
  String currentSearchTerm = "";

  /// 위도/경도
  String? latitude;
  String? longitude;

  LocationViewModel() {
    _places = GoogleMapsPlaces(apiKey: googleApiKey);
  }

  Future<void> searchLocation(String query) async {
    isFromLocation = false;
    currentSearchTerm = query;
    notifyListeners();

    if (query.isEmpty) {
      nearbyDistricts = [];
      notifyListeners();
      return;
    }

    final autocompleteResponse = await _places.autocomplete(
      query,
      language: "ko",
      components: [Component("country", "kr")],
    );

    if (autocompleteResponse.isOkay) {
      final Set<String> districtSet = {};
      log("🧾 Autocomplete Raw Response: ${autocompleteResponse.toJson()}");

      for (final prediction in autocompleteResponse.predictions) {
        final placeId = prediction.placeId;

        try {
          final details = await _places.getDetailsByPlaceId(
            placeId!,
            language: 'ko',
          );

          if (details == null || details.result == null) {
            log("Details not found for placeId: $placeId");
            continue;
          }

          final fullAddress = details.result.formattedAddress;
          log("📍 Raw address: $fullAddress");

          if (fullAddress == null) continue;

          final parsed = extractDistrictFromAddress(fullAddress);
          if (parsed.isNotEmpty) {
            districtSet.add(parsed);
          }
        } catch (e) {
          log("Error fetching details for placeId: $placeId - $e");
          continue;
        }
      }

      nearbyDistricts = districtSet.toList();
      notifyListeners();
    } else {
      log("Autocomplete Error: ${autocompleteResponse.errorMessage}");
      nearbyDistricts = [];
      notifyListeners();
    }
  }

  /// 위치 권한 요청 후, 위치 정보 가져오기
  Future<void> getGeoData() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('위치 서비스가 꺼져 있습니다.');
      return;
    }

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

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    latitude = position.latitude.toString();
    longitude = position.longitude.toString();

    isFromLocation = true;
    notifyListeners();
    await searchNearbyPlaces();

    log("위도: \$latitude, 경도: \$longitude");
  }

  /// 위치 정보로 근처 동네 리스트 검색
  Future<void> searchNearbyPlaces() async {
    if (latitude == null || longitude == null) return;

    final response = await _places.searchNearbyWithRadius(
      Location(lat: double.parse(latitude!), lng: double.parse(longitude!)),
      1000,
      language: 'ko',
    );

    if (response.isOkay && response.results.isNotEmpty) {
      final Set<String> districtSet = {};

      for (final place in response.results) {
        final detail = await _places.getDetailsByPlaceId(
          place.placeId,
          language: 'ko',
        );
        final fullAddress = detail.result.formattedAddress;

        log("📍 Raw address: $fullAddress");

        if (fullAddress == null) continue;

        final parsed = extractDistrictFromAddress(fullAddress);
        if (parsed.isNotEmpty) {
          districtSet.add(parsed);
        }
      }

      nearbyDistricts = districtSet.toList();
      notifyListeners();
    } else {
      log("주소 검색 실패: ${response.errorMessage}");
      nearbyDistricts = [];
      notifyListeners();
    }
  }

  String extractDistrictFromAddress(String address) {
    final parts = address.trim().split(" ");
    final buffer = <String>[];

    for (final part in parts) {
      buffer.add(part);
      if (part.endsWith("동") || part.endsWith("읍") || part.endsWith("면")) {
        break;
      }
    }

    if (buffer.isNotEmpty &&
        (buffer.last.endsWith("동") ||
            buffer.last.endsWith("읍") ||
            buffer.last.endsWith("면"))) {
      return buffer.join(" ");
    } else if (parts.length >= 2 &&
        (parts[0].endsWith("시") || parts[0].endsWith("도"))) {
      return "${parts[0]} ${parts[1]}";
    }

    return "";
  }

  @override
  void dispose() {
    _places.dispose();
    super.dispose();
  }
}
