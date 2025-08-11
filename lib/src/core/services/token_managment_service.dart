import 'package:delivery_app/src/core/services/shared_preference_service.dart';
import 'package:flutter/foundation.dart';

class TokenManagementService {
  final SecurePreferencesService _securePrefs = SecurePreferencesService();

  static final TokenManagementService _instance =
      TokenManagementService._internal();

  factory TokenManagementService() => _instance;

  TokenManagementService._internal();

  /// Gets the access token without checking expiry or refreshing
  Future<String?> getAccessToken() async {
    final String? accessToken = await _securePrefs.getAccessToken();
    debugPrint("Access token: $accessToken");
    return accessToken;
  }

  Future<void> saveAccessToken({required String token}) async {
    await _securePrefs.setAccessToken(token);
    debugPrint("Access token saved successfully");
  }
}
