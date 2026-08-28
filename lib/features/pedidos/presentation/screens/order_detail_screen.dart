import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../auth/application/auth_controller.dart';
import '../../../auth/domain/entities/user_role.dart';
import '../../application/order_detail_provider.dart';
import '../../application/update_order_status_controller.dart';
import '../../domain/entities/order.dart';
import '../mappers/order_exception_x.dart';
import '../mappers/order_status_x.dart';
import '../mappers/order_zone_x.dart';
import '../mappers/payment_method_x.dart';

class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderDetailProvider(orderId));

    ref.listen(updateOrderStatusControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(orderErrorMessage(next.error!))),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del pedido')),
      body: switch (orderAsync) {
        AsyncData(:final value) => _OrderDetailBody(order: value),
        AsyncError(:final error) => _ErrorState(
            message: orderErrorMessage(error),
            onRetry: () => ref.invalidate(orderDetailProvider(orderId)),
          ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _OrderDetailBody extends ConsumerWidget {
  const _OrderDetailBody({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final updateState = ref.watch(updateOrderStatusControllerProvider);
    final role = ref.watch(authControllerProvider).value?.role;
    final nextStatus = role == UserRole.repartidor ? order.estado.next : null;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(order.cliente, style: Theme.of(context).textTheme.headlineSmall),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: order.estado.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(order.estado.label, style: TextStyle(color: order.estado.color)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _DetailRow(label: 'Zona', value: order.zona.label),
        _DetailRow(label: 'Método de pago', value: order.metodoPago.label),
        _DetailRow(label: 'Monto', value: '\$${order.monto.toStringAsFixed(2)}'),
        _DetailRow(label: 'Repartidor', value: order.repartidor ?? 'Sin asignar'),
        _DetailRow(label: 'Fecha de creación', value: dateFormat.format(order.fechaCreacion)),
        _DetailRow(
          label: 'Fecha de entrega',
          value: order.fechaEntrega != null ? dateFormat.format(order.fechaEntrega!) : 'Pendiente',
        ),
        const SizedBox(height: 24),
        if (nextStatus != null)
          FilledButton(
            onPressed: updateState.isLoading
                ? null
                : () => ref
                    .read(updateOrderStatusControllerProvider.notifier)
                    .updateStatus(order.id, nextStatus),
            child: updateState.isLoading
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text('Avanzar a ${nextStatus.label}'),
          ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error, size: 40),
          const SizedBox(height: 8),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: onRetry, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}
