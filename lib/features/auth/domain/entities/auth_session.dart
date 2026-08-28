import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_role.dart';

part 'auth_session.freezed.dart';

@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String accessToken,
    required String email,
    required UserRole role,
  }) = _AuthSession;
}
