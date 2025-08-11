import 'package:delivery_app/src/core/data/network/api_endpoints.dart';
import 'package:delivery_app/src/core/data/network/network_api.dart';
import 'package:delivery_app/src/features/auth/domain/models/login_data_model.dart';
import 'package:delivery_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<LoginDataModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await NetworkApi.instance.post(
        url: ApiEndPoints.login,
        body: {'email': email, 'password': password, "requestFrom": "mobile"},
      );

      debugPrint("Login response: $response");
      if (response != null && response['data'] != null) {
        return LoginDataModel.fromJson(response['data']);
      } else {
        throw Exception("Invalid login response format");
      }
    } catch (e) {
      rethrow;
    }
  }
}
