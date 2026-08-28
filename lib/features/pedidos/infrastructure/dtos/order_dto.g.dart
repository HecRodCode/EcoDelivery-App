// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
  idPedido: json['id_pedido'] as String,
  cliente: json['cliente'] as String,
  zona: json['zona'] as String,
  fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
  fechaEntrega: json['fecha_entrega'] == null
      ? null
      : DateTime.parse(json['fecha_entrega'] as String),
  estado: json['estado'] as String,
  repartidor: json['repartidor'] as String?,
  metodoPago: json['metodo_pago'] as String,
  monto: (json['monto'] as num).toDouble(),
);

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
  'id_pedido': instance.idPedido,
  'cliente': instance.cliente,
  'zona': instance.zona,
  'fecha_creacion': instance.fechaCreacion.toIso8601String(),
  'fecha_entrega': instance.fechaEntrega?.toIso8601String(),
  'estado': instance.estado,
  'repartidor': instance.repartidor,
  'metodo_pago': instance.metodoPago,
  'monto': instance.monto,
};
