import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/orders_filter_controller.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/entities/order_zone.dart';
import '../mappers/order_status_x.dart';
import '../mappers/order_zone_x.dart';

class OrderFiltersBar extends ConsumerWidget {
  const OrderFiltersBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(ordersFilterControllerProvider);
    final controller = ref.read(ordersFilterControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<OrderStatus?>(
              initialValue: filter.estado,
              decoration: const InputDecoration(
                labelText: 'Estado',
                isDense: true,
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem(value: null, child: Text('Todos')),
                ...OrderStatus.values.map(
                  (estado) => DropdownMenuItem(value: estado, child: Text(estado.label)),
                ),
              ],
              onChanged: controller.setEstado,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButtonFormField<OrderZone?>(
              initialValue: filter.zona,
              decoration: const InputDecoration(
                labelText: 'Zona',
                isDense: true,
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem(value: null, child: Text('Todas')),
                ...OrderZone.values.map(
                  (zona) => DropdownMenuItem(value: zona, child: Text(zona.label)),
                ),
              ],
              onChanged: controller.setZona,
            ),
          ),
        ],
      ),
    );
  }
}
