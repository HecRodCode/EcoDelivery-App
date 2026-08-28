import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/auth_session.dart';
import '../domain/entities/user_role.dart';
import '../infrastructure/repositories/auth_repository_impl.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<AuthSession?> build() {
    return ref.watch(authRepositoryProvider).restoreSession();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    final repository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(() => repository.login(email: email, password: password));
  }

  Future<void> register({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () => repository.register(email: email, password: password, role: role),
    );
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }
}
