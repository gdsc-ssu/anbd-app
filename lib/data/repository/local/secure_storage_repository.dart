import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  ///토큰
  Future<String?> readAccessToken() async {
    return await _storage.read(key: "access_token");
  }

  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: "access_token", value: accessToken);
  }

  Future<String?> readRefreshToken() async {
    return await _storage.read(key: "refresh_token");
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: "refresh_token", value: refreshToken);
  }

  ///유저 정보
  Future<String?> readUserName() async {
    return await _storage.read(key: "user_name");
  }

  Future<void> saveUserName(String name) async {
    await _storage.write(key: "user_name", value: name);
  }

  Future<void> saveUserEmail(String email) async {
    await _storage.write(key: "user_email", value: email);
  }

  Future<void> readUserEmail() async {
    await _storage.read(key: "user_email");
  }

  Future<void> saveUserGender(String gender) async {
    await _storage.write(key: "user_gender", value: gender);
  }

  Future<void> readUserGender() async {
    await _storage.read(key: "user_gender");
  }

  Future<void> saveUserBirthDate(String birthDate) async {
    await _storage.write(key: "user_birth_date", value: birthDate);
  }

  Future<void> readUserBirthDate() async {
    await _storage.read(key: "user_birth_date");
  }

  Future<void> saveUserNearbyDistricts(String nearbyDistricts) async {
    await _storage.write(key: "nearby_districts", value: nearbyDistricts);
  }

  Future<void> readUserNearbyDistricts() async {
    await _storage.read(key: "nearby_districts");
  }
}
