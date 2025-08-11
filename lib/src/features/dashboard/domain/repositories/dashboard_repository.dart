import 'package:delivery_app/src/features/dashboard/domain/models/orders_model.dart';

abstract class DashBoardRepository {
  Future<List<OrderModel>> fetchCurrentOrders();
  Future<List<OrderModel>> fetchCancelledOrders({
    required int page,
    required int limit,
  });
  Future<void> startOrder({
    required String orderId,
    required String location,
    required String duration,
  });
  Future<void> cancelOrder({
    required String orderId,
    required String reason,
    required String location,
  });
}
