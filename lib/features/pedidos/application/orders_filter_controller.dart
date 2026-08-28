import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/order_status.dart';
import '../domain/entities/order_zone.dart';
import 'orders_filter.dart';

part 'orders_filter_controller.g.dart';

@riverpod
class OrdersFilterController extends _$OrdersFilterController {
  @override
  OrdersFilter build() => emptyOrdersFilter;

  void setEstado(OrderStatus? estado) {
    state = (estado: estado, zona: state.zona);
  }

  void setZona(OrderZone? zona) {
    state = (estado: state.estado, zona: zona);
  }

  void clear() {
    state = emptyOrdersFilter;
  }
}
