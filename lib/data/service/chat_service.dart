import 'dart:developer';

import 'package:anbd/data/di/api_client.dart';
import 'package:anbd/data/repository/local/secure_storage_repository.dart';

class ChatService {
  final SecureStorageRepository _secureStorage = SecureStorageRepository();
  final ApiClient _apiClient = ApiClient();
  static const apiVersion = "v1/";
}