import '../entities/auth_session.dart';
import '../entities/user_role.dart';

abstract interface class AuthRepository {
  Future<AuthSession> register({
    required String email,
    required String password,
    required UserRole role,
  });

  Future<AuthSession> login({
    required String email,
    required String password,
  });

  Future<AuthSession?> restoreSession();

  Future<void> logout();
}
