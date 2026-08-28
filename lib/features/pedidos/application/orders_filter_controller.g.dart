// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrdersFilterController)
final ordersFilterControllerProvider = OrdersFilterControllerProvider._();

final class OrdersFilterControllerProvider
    extends $NotifierProvider<OrdersFilterController, OrdersFilter> {
  OrdersFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersFilterControllerHash();

  @$internal
  @override
  OrdersFilterController create() => OrdersFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrdersFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrdersFilter>(value),
    );
  }
}

String _$ordersFilterControllerHash() =>
    r'9754f28c2eb627ff94913135b55003ace4501f1c';

abstract class _$OrdersFilterController extends $Notifier<OrdersFilter> {
  OrdersFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OrdersFilter, OrdersFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrdersFilter, OrdersFilter>,
              OrdersFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
