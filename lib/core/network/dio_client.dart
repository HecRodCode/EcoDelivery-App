import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/env_config.dart';
import 'auth_token_notifier.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
Dio dioClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: EnvConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = ref.read(authTokenProvider);
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ),
  );

  return dio;
}
