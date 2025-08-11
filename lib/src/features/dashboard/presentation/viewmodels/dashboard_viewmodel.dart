import 'package:delivery_app/src/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:delivery_app/src/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:flutter/material.dart';

class DashBoardViewModel with ChangeNotifier {
  final DashBoardRepository dashBoardRepository = DashBoardRepositoryImpl();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  
}
