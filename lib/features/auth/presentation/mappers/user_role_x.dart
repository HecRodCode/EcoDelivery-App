import '../../domain/entities/user_role.dart';

extension UserRoleX on UserRole {
  String get label {
    return switch (this) {
      UserRole.cliente => 'Cliente',
      UserRole.repartidor => 'Repartidor',
    };
  }
}
