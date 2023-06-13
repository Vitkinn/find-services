import 'package:tcc_frontend/src/modules/login/domain/entities/role_type.dart';

class LogedUserEntity {
  final String? id;
  final String? username;
  final RoleType? role;
  final String? accessToken;
  final DateTime? expiration;

  LogedUserEntity({
    this.id,
    this.username,
    this.role,
    this.accessToken,
    this.expiration,
  });

  LogedUserEntity copyWith({
    String? id,
    String? username,
    RoleType? role,
    DateTime? expiration,
    String? accessToken,
  }) {
    return LogedUserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      role: role ?? this.role,
      expiration: expiration ?? this.expiration,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
