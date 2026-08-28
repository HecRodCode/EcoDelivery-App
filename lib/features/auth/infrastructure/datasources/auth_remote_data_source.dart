import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/entities/user_role.dart';

part 'auth_remote_data_source.g.dart';

class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._dio);

  final Dio _dio;

  Future<String> register({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/register',
      data: {
        'email': email,
        'password': password,
        'role': role.name,
      },
    );
    return _extractAccessToken(response.data!);
  }

  Future<String> login({required String email, required String password}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    return _extractAccessToken(response.data!);
  }

  String _extractAccessToken(Map<String, dynamic> json) {
    return json['accessToken'] as String;
  }
}

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource(ref.watch(dioClientProvider));
}
