import '../../domain/entities/order_zone.dart';

extension OrderZoneX on OrderZone {
  String get label {
    return switch (this) {
      OrderZone.norte => 'Norte',
      OrderZone.sur => 'Sur',
      OrderZone.centro => 'Centro',
      OrderZone.occidente => 'Occidente',
      OrderZone.chapinero => 'Chapinero',
    };
  }
}
