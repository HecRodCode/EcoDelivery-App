import '../../domain/exceptions/order_exception.dart';

String orderErrorMessage(Object error) {
  if (error is OrderException) {
    return error.message;
  }

  return 'Ocurrió un error inesperado. Intenta de nuevo.';
}
