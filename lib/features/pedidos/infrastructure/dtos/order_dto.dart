import 'package:json_annotation/json_annotation.dart';

part 'order_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderDto {
  const OrderDto({
    required this.idPedido,
    required this.cliente,
    required this.zona,
    required this.fechaCreacion,
    this.fechaEntrega,
    required this.estado,
    this.repartidor,
    required this.metodoPago,
    required this.monto,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

  final String idPedido;
  final String cliente;
  final String zona;
  final DateTime fechaCreacion;
  final DateTime? fechaEntrega;
  final String estado;
  final String? repartidor;
  final String metodoPago;
  final double monto;

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}
