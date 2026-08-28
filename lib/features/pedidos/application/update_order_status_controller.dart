import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/order_status.dart';
import '../infrastructure/repositories/order_repository_impl.dart';
import 'order_detail_provider.dart';
import 'orders_provider.dart';

part 'update_order_status_controller.g.dart';

@riverpod
class UpdateOrderStatusController extends _$UpdateOrderStatusController {
  @override
  FutureOr<void> build() {}

  Future<void> updateStatus(String id, OrderStatus newStatus) async {
    state = const AsyncLoading();
    final repository = ref.read(orderRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.updateOrderStatus(id, newStatus);
    });

    if (!state.hasError) {
      ref.invalidate(orderDetailProvider(id));
      ref.invalidate(ordersProvider);
    }
  }
}
