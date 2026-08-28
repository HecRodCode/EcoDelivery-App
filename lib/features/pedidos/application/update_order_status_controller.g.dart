// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_order_status_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpdateOrderStatusController)
final updateOrderStatusControllerProvider =
    UpdateOrderStatusControllerProvider._();

final class UpdateOrderStatusControllerProvider
    extends $AsyncNotifierProvider<UpdateOrderStatusController, void> {
  UpdateOrderStatusControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateOrderStatusControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateOrderStatusControllerHash();

  @$internal
  @override
  UpdateOrderStatusController create() => UpdateOrderStatusController();
}

String _$updateOrderStatusControllerHash() =>
    r'0d5e82399be9a693089c718a4f0154690d206a88';

abstract class _$UpdateOrderStatusController extends $AsyncNotifier<void> {
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
