// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_remote_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderRemoteDataSource)
final orderRemoteDataSourceProvider = OrderRemoteDataSourceProvider._();

final class OrderRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          OrderRemoteDataSource,
          OrderRemoteDataSource,
          OrderRemoteDataSource
        >
    with $Provider<OrderRemoteDataSource> {
  OrderRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<OrderRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OrderRemoteDataSource create(Ref ref) {
    return orderRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderRemoteDataSource>(value),
    );
  }
}

String _$orderRemoteDataSourceHash() =>
    r'c8346768cd0086b42d1f9a8b78cf33f339e7eabc';
