sealed class AuthException implements Exception {
  const AuthException(this.message);

  final String message;
}

final class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException(super.message);
}

final class EmailAlreadyExistsException extends AuthException {
  const EmailAlreadyExistsException(super.message);
}

final class AuthNetworkException extends AuthException {
  const AuthNetworkException(super.message);
}

final class AuthUnknownException extends AuthException {
  const AuthUnknownException(super.message);
}
