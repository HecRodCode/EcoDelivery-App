import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_zone.dart';
import 'payment_method.dart';

part 'new_order.freezed.dart';

@freezed
abstract class NewOrder with _$NewOrder {
  const factory NewOrder({
    required String cliente,
    required OrderZone zona,
    required PaymentMethod metodoPago,
    required double monto,
  }) = _NewOrder;
}
