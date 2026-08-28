import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/entities/order_zone.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/exceptions/order_exception.dart';
import 'order_dto.dart';

extension OrderDtoMapper on OrderDto {
  Order toDomain() {
    return Order(
      id: idPedido,
      cliente: cliente,
      zona: zona.toOrderZone(),
      fechaCreacion: fechaCreacion,
      fechaEntrega: fechaEntrega,
      estado: estado.toOrderStatus(),
      repartidor: repartidor,
      metodoPago: metodoPago.toPaymentMethod(),
      monto: monto,
    );
  }
}

extension OrderZoneJson on String {
  OrderZone toOrderZone() {
    return switch (this) {
      'norte' => OrderZone.norte,
      'sur' => OrderZone.sur,
      'centro' => OrderZone.centro,
      'occidente' => OrderZone.occidente,
      'chapinero' => OrderZone.chapinero,
      _ => throw OrderUnknownException('Zona desconocida: $this'),
    };
  }

  OrderStatus toOrderStatus() {
    return switch (this) {
      'pendiente' => OrderStatus.pendiente,
      'en_camino' => OrderStatus.enCamino,
      'entregado' => OrderStatus.entregado,
      'cancelado' => OrderStatus.cancelado,
      _ => throw OrderUnknownException('Estado desconocido: $this'),
    };
  }

  PaymentMethod toPaymentMethod() {
    return switch (this) {
      'efectivo' => PaymentMethod.efectivo,
      'tarjeta' => PaymentMethod.tarjeta,
      'app' => PaymentMethod.app,
      _ => throw OrderUnknownException('Método de pago desconocido: $this'),
    };
  }
}

extension OrderZoneApi on OrderZone {
  String toApiValue() {
    return switch (this) {
      OrderZone.norte => 'norte',
      OrderZone.sur => 'sur',
      OrderZone.centro => 'centro',
      OrderZone.occidente => 'occidente',
      OrderZone.chapinero => 'chapinero',
    };
  }
}

extension OrderStatusApi on OrderStatus {
  String toApiValue() {
    return switch (this) {
      OrderStatus.pendiente => 'pendiente',
      OrderStatus.enCamino => 'en_camino',
      OrderStatus.entregado => 'entregado',
      OrderStatus.cancelado => 'cancelado',
    };
  }
}

extension PaymentMethodApi on PaymentMethod {
  String toApiValue() {
    return switch (this) {
      PaymentMethod.efectivo => 'efectivo',
      PaymentMethod.tarjeta => 'tarjeta',
      PaymentMethod.app => 'app',
    };
  }
}
