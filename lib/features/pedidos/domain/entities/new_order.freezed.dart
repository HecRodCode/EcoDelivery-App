// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewOrder {

 String get cliente; OrderZone get zona; PaymentMethod get metodoPago; double get monto;
/// Create a copy of NewOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewOrderCopyWith<NewOrder> get copyWith => _$NewOrderCopyWithImpl<NewOrder>(this as NewOrder, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewOrder&&(identical(other.cliente, cliente) || other.cliente == cliente)&&(identical(other.zona, zona) || other.zona == zona)&&(identical(other.metodoPago, metodoPago) || other.metodoPago == metodoPago)&&(identical(other.monto, monto) || other.monto == monto));
}


@override
int get hashCode => Object.hash(runtimeType,cliente,zona,metodoPago,monto);

@override
String toString() {
  return 'NewOrder(cliente: $cliente, zona: $zona, metodoPago: $metodoPago, monto: $monto)';
}


}

/// @nodoc
abstract mixin class $NewOrderCopyWith<$Res>  {
  factory $NewOrderCopyWith(NewOrder value, $Res Function(NewOrder) _then) = _$NewOrderCopyWithImpl;
@useResult
$Res call({
 String cliente, OrderZone zona, PaymentMethod metodoPago, double monto
});




}
/// @nodoc
class _$NewOrderCopyWithImpl<$Res>
    implements $NewOrderCopyWith<$Res> {
  _$NewOrderCopyWithImpl(this._self, this._then);

  final NewOrder _self;
  final $Res Function(NewOrder) _then;

/// Create a copy of NewOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cliente = null,Object? zona = null,Object? metodoPago = null,Object? monto = null,}) {
  return _then(_self.copyWith(
cliente: null == cliente ? _self.cliente : cliente // ignore: cast_nullable_to_non_nullable
as String,zona: null == zona ? _self.zona : zona // ignore: cast_nullable_to_non_nullable
as OrderZone,metodoPago: null == metodoPago ? _self.metodoPago : metodoPago // ignore: cast_nullable_to_non_nullable
as PaymentMethod,monto: null == monto ? _self.monto : monto // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NewOrder].
extension NewOrderPatterns on NewOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewOrder value)  $default,){
final _that = this;
switch (_that) {
case _NewOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewOrder value)?  $default,){
final _that = this;
switch (_that) {
case _NewOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cliente,  OrderZone zona,  PaymentMethod metodoPago,  double monto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewOrder() when $default != null:
return $default(_that.cliente,_that.zona,_that.metodoPago,_that.monto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cliente,  OrderZone zona,  PaymentMethod metodoPago,  double monto)  $default,) {final _that = this;
switch (_that) {
case _NewOrder():
return $default(_that.cliente,_that.zona,_that.metodoPago,_that.monto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cliente,  OrderZone zona,  PaymentMethod metodoPago,  double monto)?  $default,) {final _that = this;
switch (_that) {
case _NewOrder() when $default != null:
return $default(_that.cliente,_that.zona,_that.metodoPago,_that.monto);case _:
  return null;

}
}

}

/// @nodoc


class _NewOrder implements NewOrder {
  const _NewOrder({required this.cliente, required this.zona, required this.metodoPago, required this.monto});
  

@override final  String cliente;
@override final  OrderZone zona;
@override final  PaymentMethod metodoPago;
@override final  double monto;

/// Create a copy of NewOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewOrderCopyWith<_NewOrder> get copyWith => __$NewOrderCopyWithImpl<_NewOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewOrder&&(identical(other.cliente, cliente) || other.cliente == cliente)&&(identical(other.zona, zona) || other.zona == zona)&&(identical(other.metodoPago, metodoPago) || other.metodoPago == metodoPago)&&(identical(other.monto, monto) || other.monto == monto));
}


@override
int get hashCode => Object.hash(runtimeType,cliente,zona,metodoPago,monto);

@override
String toString() {
  return 'NewOrder(cliente: $cliente, zona: $zona, metodoPago: $metodoPago, monto: $monto)';
}


}

/// @nodoc
abstract mixin class _$NewOrderCopyWith<$Res> implements $NewOrderCopyWith<$Res> {
  factory _$NewOrderCopyWith(_NewOrder value, $Res Function(_NewOrder) _then) = __$NewOrderCopyWithImpl;
@override @useResult
$Res call({
 String cliente, OrderZone zona, PaymentMethod metodoPago, double monto
});




}
/// @nodoc
class __$NewOrderCopyWithImpl<$Res>
    implements _$NewOrderCopyWith<$Res> {
  __$NewOrderCopyWithImpl(this._self, this._then);

  final _NewOrder _self;
  final $Res Function(_NewOrder) _then;

/// Create a copy of NewOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cliente = null,Object? zona = null,Object? metodoPago = null,Object? monto = null,}) {
  return _then(_NewOrder(
cliente: null == cliente ? _self.cliente : cliente // ignore: cast_nullable_to_non_nullable
as String,zona: null == zona ? _self.zona : zona // ignore: cast_nullable_to_non_nullable
as OrderZone,metodoPago: null == metodoPago ? _self.metodoPago : metodoPago // ignore: cast_nullable_to_non_nullable
as PaymentMethod,monto: null == monto ? _self.monto : monto // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
