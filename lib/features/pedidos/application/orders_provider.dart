import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/order.dart';
import '../infrastructure/repositories/order_repository_impl.dart';
import 'orders_filter.dart';

part 'orders_provider.g.dart';

@riverpod
Future<List<Order>> orders(Ref ref, OrdersFilter filter) {
  final repository = ref.watch(orderRepositoryProvider);
  return repository.getOrders(estado: filter.estado, zona: filter.zona);
}
