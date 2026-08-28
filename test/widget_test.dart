import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecodelivery_app/features/auth/domain/entities/auth_session.dart';
import 'package:ecodelivery_app/features/auth/domain/entities/user_role.dart';
import 'package:ecodelivery_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecodelivery_app/features/auth/infrastructure/repositories/auth_repository_impl.dart';
import 'package:ecodelivery_app/features/pedidos/domain/entities/new_order.dart';
import 'package:ecodelivery_app/features/pedidos/domain/entities/order.dart';
import 'package:ecodelivery_app/features/pedidos/domain/entities/order_status.dart';
import 'package:ecodelivery_app/features/pedidos/domain/entities/order_zone.dart';
import 'package:ecodelivery_app/features/pedidos/domain/repositories/order_repository.dart';
import 'package:ecodelivery_app/features/pedidos/infrastructure/repositories/order_repository_impl.dart';
import 'package:ecodelivery_app/main.dart';

class _FakeOrderRepository implements OrderRepository {
  @override
  Future<List<Order>> getOrders({OrderStatus? estado, OrderZone? zona}) async => [];

  @override
  Future<Order> getOrderById(String id) => throw UnimplementedError();

  @override
  Future<Order> createOrder(NewOrder input) => throw UnimplementedError();

  @override
  Future<Order> updateOrderStatus(String id, OrderStatus newStatus) => throw UnimplementedError();
}

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository({this.session});

  final AuthSession? session;

  @override
  Future<AuthSession?> restoreSession() async => session;

  @override
  Future<AuthSession> login({required String email, required String password}) =>
      throw UnimplementedError();

  @override
  Future<AuthSession> register({
    required String email,
    required String password,
    required UserRole role,
  }) =>
      throw UnimplementedError();

  @override
  Future<void> logout() async {}
}

void main() {
  testWidgets('Sin sesión muestra la pantalla de login', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [authRepositoryProvider.overrideWithValue(_FakeAuthRepository())],
        child: const EcoDeliveryApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('EcoDelivery'), findsOneWidget);
    expect(find.text('Ingresar'), findsOneWidget);
  });

  testWidgets('Con sesión de cliente muestra la lista de pedidos vacía', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(
            _FakeAuthRepository(
              session: const AuthSession(
                accessToken: 'fake-token',
                email: 'cliente@test.com',
                role: UserRole.cliente,
              ),
            ),
          ),
          orderRepositoryProvider.overrideWithValue(_FakeOrderRepository()),
        ],
        child: const EcoDeliveryApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Pedidos'), findsOneWidget);
    expect(find.text('No hay pedidos con estos filtros.'), findsOneWidget);
  });
}
