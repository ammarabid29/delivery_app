import 'package:delivery_app/src/core/data/network/network_api.dart';
import 'package:delivery_app/src/features/dashboard/domain/models/orders_model.dart';
import 'package:delivery_app/src/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:geolocator/geolocator.dart';

class DashBoardRepositoryImpl implements DashBoardRepository {
  final baseUrl = "http://152.53.82.172:4000/api/v1/delivery-riders";

  @override
  Future<List<OrderModel>> fetchCurrentOrders() async {
    try {
      final response = await NetworkApi.instance.get(
        url: "$baseUrl/current-orders",
      );

      final List<dynamic> data = response['currentOrders'];
      return data.map((e) => OrderModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderModel>> fetchCancelledOrders({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await NetworkApi.instance.get(
        url: "$baseUrl/cancelled-orders?limit={$limit}&page={$page}",
      );

      final List<dynamic> data = response['orders'];
      return data.map((e) => OrderModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> startOrder({
    required String orderId,
    required String location,
    required String duration,
  }) async {
    try {
      await NetworkApi.instance.patch(
        url: '$baseUrl/orders/$orderId/status',
        body: {
          "status": "Order Started",
          "cancelReason": "",
          "location": location,
          "duration": duration,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> cancelOrder({
    required String orderId,
    required String reason,
    required String location,
  }) async {
    try {
      await NetworkApi.instance.patch(
        url: '$baseUrl/orders/$orderId/status',
        body: {
          "status": "Cancelled",
          "cancelReason": reason,
          "location": location,
          "duration": "",
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Utility method (optional, call from ViewModel/UI)
  Future<Position?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return null;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return null;
      }

      if (permission == LocationPermission.deniedForever) return null;

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      rethrow;
    }
  }
}
