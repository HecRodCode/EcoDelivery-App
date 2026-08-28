import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/order_status.dart';

extension OrderStatusX on OrderStatus {
  String get label {
    return switch (this) {
      OrderStatus.pendiente => 'Pendiente',
      OrderStatus.enCamino => 'En camino',
      OrderStatus.entregado => 'Entregado',
      OrderStatus.cancelado => 'Cancelado',
    };
  }

  Color get color {
    return switch (this) {
      OrderStatus.pendiente => AppColors.statusPendiente,
      OrderStatus.enCamino => AppColors.statusEnCamino,
      OrderStatus.entregado => AppColors.statusEntregado,
      OrderStatus.cancelado => AppColors.statusCancelado,
    };
  }

  OrderStatus? get next {
    return switch (this) {
      OrderStatus.pendiente => OrderStatus.enCamino,
      OrderStatus.enCamino => OrderStatus.entregado,
      OrderStatus.entregado => null,
      OrderStatus.cancelado => null,
    };
  }
}
