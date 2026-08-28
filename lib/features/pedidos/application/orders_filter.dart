import '../domain/entities/order_status.dart';
import '../domain/entities/order_zone.dart';

typedef OrdersFilter = ({OrderStatus? estado, OrderZone? zona});

const emptyOrdersFilter = (estado: null, zona: null);
