// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthTokenNotifier)
final authTokenProvider = AuthTokenNotifierProvider._();

final class AuthTokenNotifierProvider
    extends $NotifierProvider<AuthTokenNotifier, String?> {
  AuthTokenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authTokenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authTokenNotifierHash();

  @$internal
  @override
  AuthTokenNotifier create() => AuthTokenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$authTokenNotifierHash() => r'4e9116c3e0d7a4ef56ff96fdc5b2b2474574ed7f';

abstract class _$AuthTokenNotifier extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
