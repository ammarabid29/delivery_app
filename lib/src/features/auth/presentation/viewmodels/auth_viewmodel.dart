import 'package:delivery_app/src/core/commons/custom_navigation.dart';
import 'package:delivery_app/src/core/services/shared_preference_service.dart';
import 'package:delivery_app/src/features/dashboard/presentation/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:delivery_app/src/features/auth/domain/repositories/auth_repository.dart';

class AuthViewmodel with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepositoryImpl();
  final SecurePreferencesService _securePreferencesService =
      SecurePreferencesService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setLoading(true);
    try {
      final loginData = await _authRepository.login(
        email: email,
        password: password,
      );

      if (loginData == null) {
        throw Exception("Login failed. Please check your credentials.");
      }

      await _securePreferencesService.setAccessToken(loginData.accessToken!);
      await _securePreferencesService.setRefreshToken(loginData.refreshToken!);

      // ✅ Now we can navigate
      CustomNavigation().pushAndRemoveUntil(const DashboardScreen());
    } catch (error) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
