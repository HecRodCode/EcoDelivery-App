import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_storage.g.dart';

class TokenStorage {
  const TokenStorage(this._storage);

  static const _accessTokenKey = 'auth_access_token';

  final FlutterSecureStorage _storage;

  Future<void> save(String token) => _storage.write(key: _accessTokenKey, value: token);

  Future<String?> read() => _storage.read(key: _accessTokenKey);

  Future<void> clear() => _storage.delete(key: _accessTokenKey);
}

@Riverpod(keepAlive: true)
TokenStorage tokenStorage(Ref ref) {
  return const TokenStorage(FlutterSecureStorage());
}
