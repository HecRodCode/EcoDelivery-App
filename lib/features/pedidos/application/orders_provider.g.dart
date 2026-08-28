// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orders)
final ordersProvider = OrdersFamily._();

final class OrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Order>>,
          List<Order>,
          FutureOr<List<Order>>
        >
    with $FutureModifier<List<Order>>, $FutureProvider<List<Order>> {
  OrdersProvider._({
    required OrdersFamily super.from,
    required OrdersFilter super.argument,
  }) : super(
         retry: null,
         name: r'ordersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ordersHash();

  @override
  String toString() {
    return r'ordersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Order>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Order>> create(Ref ref) {
    final argument = this.argument as OrdersFilter;
    return orders(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OrdersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ordersHash() => r'86ee16df6d1570a0c270daa5a5ec44da9bb50203';

final class OrdersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Order>>, OrdersFilter> {
  OrdersFamily._()
    : super(
        retry: null,
        name: r'ordersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrdersProvider call(OrdersFilter filter) =>
      OrdersProvider._(argument: filter, from: this);

  @override
  String toString() => r'ordersProvider';
}
