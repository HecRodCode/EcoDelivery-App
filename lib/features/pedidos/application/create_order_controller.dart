import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/new_order.dart';
import '../infrastructure/repositories/order_repository_impl.dart';
import 'orders_provider.dart';

part 'create_order_controller.g.dart';

@riverpod
class CreateOrderController extends _$CreateOrderController {
  @override
  FutureOr<void> build() {}

  Future<void> submit(NewOrder input) async {
    state = const AsyncLoading();
    final repository = ref.read(orderRepositoryProvider);
    state = await AsyncValue.guard(() => repository.createOrder(input));

    if (!state.hasError) {
      ref.invalidate(ordersProvider);
    }
  }
}
