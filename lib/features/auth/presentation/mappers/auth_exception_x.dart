import '../../domain/exceptions/auth_exception.dart';

String authErrorMessage(Object error) {
  if (error is AuthException) {
    return error.message;
  }

  return 'Ocurrió un error inesperado. Intenta de nuevo.';
}
