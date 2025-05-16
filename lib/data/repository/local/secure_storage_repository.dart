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

  Future<String?> readUserEmail() async {
    return await _storage.read(key: "user_email");
  }

  Future<void> saveUserGender(String gender) async {
    await _storage.write(key: "user_gender", value: gender);
  }

  Future<String?> readUserGender() async {
    return await _storage.read(key: "user_gender");
  }

  Future<void> saveUserBirthDate(String birthDate) async {
    await _storage.write(key: "user_birth_date", value: birthDate);
  }

  Future<String?> readUserBirthDate() async {
    return await _storage.read(key: "user_birth_date");
  }

  Future<void> saveUserNearbyDistricts(String nearbyDistricts) async {
    await _storage.write(key: "nearby_districts", value: nearbyDistricts);
  }

  Future<String?> readUserNearbyDistricts() async {
    return await _storage.read(key: "nearby_districts");
  }

  ///모든 데이터 삭제
  Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }

  Future<void> saveUserId(int userId) async {
    await _storage.write(key: 'userId', value: userId.toString()); // ✅ 문자열로 저장
  }

  Future<int?> getUserId() async {
    final value = await _storage.read(key: 'userId');
    return value != null ? int.tryParse(value) : null; // ✅ 문자열 → int 변환
  }
}
