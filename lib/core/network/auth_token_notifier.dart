import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_token_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthTokenNotifier extends _$AuthTokenNotifier {
  @override
  String? build() => null;

  void set(String? token) {
    state = token;
  }
}
