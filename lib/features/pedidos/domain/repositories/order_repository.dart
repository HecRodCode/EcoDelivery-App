import '../entities/new_order.dart';
import '../entities/order.dart';
import '../entities/order_status.dart';
import '../entities/order_zone.dart';

abstract interface class OrderRepository {
  Future<List<Order>> getOrders({OrderStatus? estado, OrderZone? zona});

  Future<Order> getOrderById(String id);

  Future<Order> createOrder(NewOrder input);

  Future<Order> updateOrderStatus(String id, OrderStatus newStatus);
}
