// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Order {

 String get id; String get cliente; OrderZone get zona; DateTime get fechaCreacion; DateTime? get fechaEntrega; OrderStatus get estado; String? get repartidor; PaymentMethod get metodoPago; double get monto;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.cliente, cliente) || other.cliente == cliente)&&(identical(other.zona, zona) || other.zona == zona)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaEntrega, fechaEntrega) || other.fechaEntrega == fechaEntrega)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.repartidor, repartidor) || other.repartidor == repartidor)&&(identical(other.metodoPago, metodoPago) || other.metodoPago == metodoPago)&&(identical(other.monto, monto) || other.monto == monto));
}


@override
int get hashCode => Object.hash(runtimeType,id,cliente,zona,fechaCreacion,fechaEntrega,estado,repartidor,metodoPago,monto);

@override
String toString() {
  return 'Order(id: $id, cliente: $cliente, zona: $zona, fechaCreacion: $fechaCreacion, fechaEntrega: $fechaEntrega, estado: $estado, repartidor: $repartidor, metodoPago: $metodoPago, monto: $monto)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, String cliente, OrderZone zona, DateTime fechaCreacion, DateTime? fechaEntrega, OrderStatus estado, String? repartidor, PaymentMethod metodoPago, double monto
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cliente = null,Object? zona = null,Object? fechaCreacion = null,Object? fechaEntrega = freezed,Object? estado = null,Object? repartidor = freezed,Object? metodoPago = null,Object? monto = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cliente: null == cliente ? _self.cliente : cliente // ignore: cast_nullable_to_non_nullable
as String,zona: null == zona ? _self.zona : zona // ignore: cast_nullable_to_non_nullable
as OrderZone,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,fechaEntrega: freezed == fechaEntrega ? _self.fechaEntrega : fechaEntrega // ignore: cast_nullable_to_non_nullable
as DateTime?,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as OrderStatus,repartidor: freezed == repartidor ? _self.repartidor : repartidor // ignore: cast_nullable_to_non_nullable
as String?,metodoPago: null == metodoPago ? _self.metodoPago : metodoPago // ignore: cast_nullable_to_non_nullable
as PaymentMethod,monto: null == monto ? _self.monto : monto // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String cliente,  OrderZone zona,  DateTime fechaCreacion,  DateTime? fechaEntrega,  OrderStatus estado,  String? repartidor,  PaymentMethod metodoPago,  double monto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.cliente,_that.zona,_that.fechaCreacion,_that.fechaEntrega,_that.estado,_that.repartidor,_that.metodoPago,_that.monto);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String cliente,  OrderZone zona,  DateTime fechaCreacion,  DateTime? fechaEntrega,  OrderStatus estado,  String? repartidor,  PaymentMethod metodoPago,  double monto)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.cliente,_that.zona,_that.fechaCreacion,_that.fechaEntrega,_that.estado,_that.repartidor,_that.metodoPago,_that.monto);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String cliente,  OrderZone zona,  DateTime fechaCreacion,  DateTime? fechaEntrega,  OrderStatus estado,  String? repartidor,  PaymentMethod metodoPago,  double monto)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.cliente,_that.zona,_that.fechaCreacion,_that.fechaEntrega,_that.estado,_that.repartidor,_that.metodoPago,_that.monto);case _:
  return null;

}
}

}

/// @nodoc


class _Order implements Order {
  const _Order({required this.id, required this.cliente, required this.zona, required this.fechaCreacion, this.fechaEntrega, required this.estado, this.repartidor, required this.metodoPago, required this.monto});
  

@override final  String id;
@override final  String cliente;
@override final  OrderZone zona;
@override final  DateTime fechaCreacion;
@override final  DateTime? fechaEntrega;
@override final  OrderStatus estado;
@override final  String? repartidor;
@override final  PaymentMethod metodoPago;
@override final  double monto;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.cliente, cliente) || other.cliente == cliente)&&(identical(other.zona, zona) || other.zona == zona)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaEntrega, fechaEntrega) || other.fechaEntrega == fechaEntrega)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.repartidor, repartidor) || other.repartidor == repartidor)&&(identical(other.metodoPago, metodoPago) || other.metodoPago == metodoPago)&&(identical(other.monto, monto) || other.monto == monto));
}


@override
int get hashCode => Object.hash(runtimeType,id,cliente,zona,fechaCreacion,fechaEntrega,estado,repartidor,metodoPago,monto);

@override
String toString() {
  return 'Order(id: $id, cliente: $cliente, zona: $zona, fechaCreacion: $fechaCreacion, fechaEntrega: $fechaEntrega, estado: $estado, repartidor: $repartidor, metodoPago: $metodoPago, monto: $monto)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String cliente, OrderZone zona, DateTime fechaCreacion, DateTime? fechaEntrega, OrderStatus estado, String? repartidor, PaymentMethod metodoPago, double monto
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cliente = null,Object? zona = null,Object? fechaCreacion = null,Object? fechaEntrega = freezed,Object? estado = null,Object? repartidor = freezed,Object? metodoPago = null,Object? monto = null,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cliente: null == cliente ? _self.cliente : cliente // ignore: cast_nullable_to_non_nullable
as String,zona: null == zona ? _self.zona : zona // ignore: cast_nullable_to_non_nullable
as OrderZone,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,fechaEntrega: freezed == fechaEntrega ? _self.fechaEntrega : fechaEntrega // ignore: cast_nullable_to_non_nullable
as DateTime?,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as OrderStatus,repartidor: freezed == repartidor ? _self.repartidor : repartidor // ignore: cast_nullable_to_non_nullable
as String?,metodoPago: null == metodoPago ? _self.metodoPago : metodoPago // ignore: cast_nullable_to_non_nullable
as PaymentMethod,monto: null == monto ? _self.monto : monto // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
