import 'package:findservices/src/modules/login/domain/entities/role_type.dart';

class LogedUserEntity {
  final String? id;
  final String? username;
  final String? login;
  final RoleType? role;
  final String? accessToken;
  final DateTime? expiration;
  final String? photoUrl;

  LogedUserEntity({
    this.id,
    this.username,
    this.role,
    this.accessToken,
    this.expiration,
    this.login,
    this.photoUrl,
  });

  LogedUserEntity copyWith({
    String? id,
    String? username,
    RoleType? role,
    DateTime? expiration,
    String? accessToken,
    String? login,
    String? photoUrl,
  }) {
    return LogedUserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      role: role ?? this.role,
      expiration: expiration ?? this.expiration,
      accessToken: accessToken ?? this.accessToken,
      login: login ?? this.login,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
