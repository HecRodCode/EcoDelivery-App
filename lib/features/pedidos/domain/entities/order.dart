import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_status.dart';
import 'order_zone.dart';
import 'payment_method.dart';

part 'order.freezed.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    required String cliente,
    required OrderZone zona,
    required DateTime fechaCreacion,
    DateTime? fechaEntrega,
    required OrderStatus estado,
    String? repartidor,
    required PaymentMethod metodoPago,
    required double monto,
  }) = _Order;
}
