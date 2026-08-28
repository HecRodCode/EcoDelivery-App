import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/order.dart';
import '../infrastructure/repositories/order_repository_impl.dart';

part 'order_detail_provider.g.dart';

@riverpod
Future<Order> orderDetail(Ref ref, String id) {
  final repository = ref.watch(orderRepositoryProvider);
  return repository.getOrderById(id);
}
