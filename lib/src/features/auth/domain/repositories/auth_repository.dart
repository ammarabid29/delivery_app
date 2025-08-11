import 'package:delivery_app/src/features/auth/domain/models/login_data_model.dart';

abstract class AuthRepository {
  Future<LoginDataModel?> login({required String email, required String password});
}
