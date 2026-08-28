import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/application/auth_controller.dart';
import '../../../auth/domain/entities/user_role.dart';
import '../../application/orders_filter_controller.dart';
import '../../application/orders_provider.dart';
import '../mappers/order_exception_x.dart';
import '../widgets/order_filters_bar.dart';
import '../widgets/order_list_item.dart';
import 'create_order_screen.dart';
import 'order_detail_screen.dart';

class OrderListScreen extends ConsumerWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(ordersFilterControllerProvider);
    final ordersAsync = ref.watch(ordersProvider(filter));
    final role = ref.watch(authControllerProvider).value?.role;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        actions: [
          IconButton(
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: Column(
        children: [
          const OrderFiltersBar(),
          Expanded(
            child: switch (ordersAsync) {
              AsyncData(:final value) => value.isEmpty
                  ? _EmptyState(onRefresh: () => ref.invalidate(ordersProvider(filter)))
                  : RefreshIndicator(
                      onRefresh: () => ref.refresh(ordersProvider(filter).future),
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          final order = value[index];
                          return OrderListItem(
                            order: order,
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => OrderDetailScreen(orderId: order.id),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              AsyncError(:final error) => _ErrorState(
                  message: orderErrorMessage(error),
                  onRetry: () => ref.invalidate(ordersProvider(filter)),
                ),
              _ => const Center(child: CircularProgressIndicator()),
            },
          ),
        ],
      ),
      floatingActionButton: role == UserRole.cliente
          ? FloatingActionButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CreateOrderScreen()),
              ),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('No hay pedidos con estos filtros.'),
          TextButton(onPressed: onRefresh, child: const Text('Refrescar')),
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
