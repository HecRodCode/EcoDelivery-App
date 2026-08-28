// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateOrderController)
final createOrderControllerProvider = CreateOrderControllerProvider._();

final class CreateOrderControllerProvider
    extends $AsyncNotifierProvider<CreateOrderController, void> {
  CreateOrderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createOrderControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createOrderControllerHash();

  @$internal
  @override
  CreateOrderController create() => CreateOrderController();
}

String _$createOrderControllerHash() =>
    r'bb606d4cd76ea3d92646b15172d66496d3482b71';

abstract class _$CreateOrderController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
