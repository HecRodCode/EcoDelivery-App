import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/create_order_controller.dart';
import '../../domain/entities/new_order.dart';
import '../../domain/entities/order_zone.dart';
import '../../domain/entities/payment_method.dart';
import '../mappers/order_exception_x.dart';
import '../mappers/order_zone_x.dart';
import '../mappers/payment_method_x.dart';

class CreateOrderScreen extends ConsumerStatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  ConsumerState<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends ConsumerState<CreateOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _clienteController = TextEditingController();
  final _montoController = TextEditingController();
  OrderZone? _zona;
  PaymentMethod? _metodoPago;

  @override
  void dispose() {
    _clienteController.dispose();
    _montoController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final input = NewOrder(
      cliente: _clienteController.text.trim(),
      zona: _zona!,
      metodoPago: _metodoPago!,
      monto: double.parse(_montoController.text.replaceAll(',', '.')),
    );

    await ref.read(createOrderControllerProvider.notifier).submit(input);

    final state = ref.read(createOrderControllerProvider);
    if (!mounted) return;

    if (!state.hasError) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final createState = ref.watch(createOrderControllerProvider);

    ref.listen(createOrderControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(orderErrorMessage(next.error!))),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Crear pedido')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _clienteController,
              decoration: const InputDecoration(labelText: 'Cliente', border: OutlineInputBorder()),
              validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'El cliente es requerido' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<OrderZone>(
              initialValue: _zona,
              decoration: const InputDecoration(labelText: 'Zona', border: OutlineInputBorder()),
              items: OrderZone.values
                  .map((zona) => DropdownMenuItem(value: zona, child: Text(zona.label)))
                  .toList(),
              onChanged: (value) => setState(() => _zona = value),
              validator: (value) => value == null ? 'Selecciona una zona' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<PaymentMethod>(
              initialValue: _metodoPago,
              decoration: const InputDecoration(
                labelText: 'Método de pago',
                border: OutlineInputBorder(),
              ),
              items: PaymentMethod.values
                  .map((metodo) => DropdownMenuItem(value: metodo, child: Text(metodo.label)))
                  .toList(),
              onChanged: (value) => setState(() => _metodoPago = value),
              validator: (value) => value == null ? 'Selecciona un método de pago' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _montoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Monto', border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.trim().isEmpty) return 'El monto es requerido';
                final parsed = double.tryParse(value.replaceAll(',', '.'));
                if (parsed == null || parsed <= 0) return 'Ingresa un monto válido';
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: createState.isLoading ? null : _submit,
              child: createState.isLoading
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Crear pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
