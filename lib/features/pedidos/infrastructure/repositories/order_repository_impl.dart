import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/new_order.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/entities/order_zone.dart';
import '../../domain/exceptions/order_exception.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';
import '../dtos/order_mapper.dart';

part 'order_repository_impl.g.dart';

class OrderRepositoryImpl implements OrderRepository {
  const OrderRepositoryImpl(this._dataSource);

  final OrderRemoteDataSource _dataSource;

  @override
  Future<List<Order>> getOrders({OrderStatus? estado, OrderZone? zona}) async {
    try {
      final dtos = await _dataSource.getOrders(estado: estado, zona: zona);
      return dtos.map((dto) => dto.toDomain()).toList();
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<Order> getOrderById(String id) async {
    try {
      final dto = await _dataSource.getOrderById(id);
      return dto.toDomain();
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<Order> createOrder(NewOrder input) async {
    try {
      final dto = await _dataSource.createOrder(
        cliente: input.cliente,
        zona: input.zona,
        metodoPago: input.metodoPago,
        monto: input.monto,
      );
      return dto.toDomain();
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<Order> updateOrderStatus(String id, OrderStatus newStatus) async {
    try {
      final dto = await _dataSource.updateOrderStatus(id, newStatus);
      return dto.toDomain();
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  OrderException _mapDioException(DioException error) {
    final statusCode = error.response?.statusCode;

    if (statusCode == 404) {
      return const OrderNotFoundException('El pedido no existe.');
    }

    if (statusCode == 400) {
      return OrderValidationException(
        error.response?.data is Map
            ? (error.response!.data['message']?.toString() ?? 'Datos inválidos.')
            : 'Datos inválidos.',
      );
    }

    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return const OrderNetworkException('No se pudo conectar con el servidor.');
    }

    return OrderUnknownException(error.message ?? 'Error desconocido.');
  }
}

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) {
  return OrderRepositoryImpl(ref.watch(orderRemoteDataSourceProvider));
}
