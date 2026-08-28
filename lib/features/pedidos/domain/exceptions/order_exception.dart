sealed class OrderException implements Exception {
  const OrderException(this.message);

  final String message;
}

final class OrderNotFoundException extends OrderException {
  const OrderNotFoundException(super.message);
}

final class OrderValidationException extends OrderException {
  const OrderValidationException(super.message);
}

final class OrderNetworkException extends OrderException {
  const OrderNetworkException(super.message);
}

final class OrderUnknownException extends OrderException {
  const OrderUnknownException(super.message);
}
