import '../../domain/entities/payment_method.dart';

extension PaymentMethodX on PaymentMethod {
  String get label {
    return switch (this) {
      PaymentMethod.efectivo => 'Efectivo',
      PaymentMethod.tarjeta => 'Tarjeta',
      PaymentMethod.app => 'App',
    };
  }
}
