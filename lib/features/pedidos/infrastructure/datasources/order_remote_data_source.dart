import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/entities/order_zone.dart';
import '../../domain/entities/payment_method.dart';
import '../dtos/order_dto.dart';
import '../dtos/order_mapper.dart';

part 'order_remote_data_source.g.dart';

class OrderRemoteDataSource {
  const OrderRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<OrderDto>> getOrders({OrderStatus? estado, OrderZone? zona}) async {
    final response = await _dio.get<List<dynamic>>(
      '/pedidos',
      queryParameters: {
        if (estado != null) 'estado': estado.toApiValue(),
        if (zona != null) 'zona': zona.toApiValue(),
      },
    );

    return response.data!
        .map((json) => OrderDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<OrderDto> getOrderById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/pedidos/$id');
    return OrderDto.fromJson(response.data!);
  }

  Future<OrderDto> createOrder({
    required String cliente,
    required OrderZone zona,
    required PaymentMethod metodoPago,
    required double monto,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/pedidos',
      data: {
        'cliente': cliente,
        'zona': zona.toApiValue(),
        'metodo_pago': metodoPago.toApiValue(),
        'monto': monto,
      },
    );
    return OrderDto.fromJson(response.data!);
  }

  Future<OrderDto> updateOrderStatus(String id, OrderStatus newStatus) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/pedidos/$id/estado',
      data: {'estado': newStatus.toApiValue()},
    );
    return OrderDto.fromJson(response.data!);
  }
}

@Riverpod(keepAlive: true)
OrderRemoteDataSource orderRemoteDataSource(Ref ref) {
  return OrderRemoteDataSource(ref.watch(dioClientProvider));
}
