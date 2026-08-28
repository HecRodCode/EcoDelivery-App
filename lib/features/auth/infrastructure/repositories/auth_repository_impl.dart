import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/auth_token_notifier.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/user_role.dart';
import '../../domain/exceptions/auth_exception.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/jwt_decoder.dart';
import '../datasources/token_storage.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._dataSource, this._tokenStorage, this._tokenNotifier);

  final AuthRemoteDataSource _dataSource;
  final TokenStorage _tokenStorage;
  final AuthTokenNotifier _tokenNotifier;

  @override
  Future<AuthSession> register({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    try {
      final token = await _dataSource.register(email: email, password: password, role: role);
      return _buildSession(token, fallbackEmail: email, fallbackRole: role);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<AuthSession> login({required String email, required String password}) async {
    try {
      final token = await _dataSource.login(email: email, password: password);
      return _buildSession(token, fallbackEmail: email);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  @override
  Future<AuthSession?> restoreSession() async {
    final token = await _tokenStorage.read();
    if (token == null) return null;

    try {
      final session = _buildSession(token);
      _tokenNotifier.set(token);
      return session;
    } on FormatException {
      await _tokenStorage.clear();
      return null;
    }
  }

  @override
  Future<void> logout() async {
    await _tokenStorage.clear();
    _tokenNotifier.set(null);
  }

  Future<AuthSession> _buildSession(
    String token, {
    String? fallbackEmail,
    UserRole? fallbackRole,
  }) async {
    final payload = decodeJwtPayload(token);

    final email = payload['email'] as String? ?? fallbackEmail;
    final role = _roleFromClaim(payload['role']) ?? fallbackRole;

    if (email == null || role == null) {
      throw const AuthUnknownException('No se pudo interpretar la sesión del servidor.');
    }

    await _tokenStorage.save(token);
    _tokenNotifier.set(token);

    return AuthSession(accessToken: token, email: email, role: role);
  }

  UserRole? _roleFromClaim(dynamic value) {
    if (value is! String) return null;
    return switch (value) {
      'cliente' => UserRole.cliente,
      'repartidor' => UserRole.repartidor,
      _ => null,
    };
  }

  AuthException _mapDioException(DioException error) {
    final statusCode = error.response?.statusCode;

    if (statusCode == 401) {
      return const InvalidCredentialsException('Correo o contraseña incorrectos.');
    }

    if (statusCode == 409) {
      return const EmailAlreadyExistsException('Ese correo ya está registrado.');
    }

    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return const AuthNetworkException('No se pudo conectar con el servidor.');
    }

    return AuthUnknownException(error.message ?? 'Error desconocido.');
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(tokenStorageProvider),
    ref.watch(authTokenProvider.notifier),
  );
}
