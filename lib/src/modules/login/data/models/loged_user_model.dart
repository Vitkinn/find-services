import 'package:findservices/src/modules/login/domain/entities/loged_user_entity.dart';

import '../../domain/entities/role_type.dart';

class LogedUserModel extends LogedUserEntity {
  LogedUserModel({
    required super.id,
    required super.username,
    required super.role,
    required super.accessToken,
    required super.expiration,
    required super.login,
    required super.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "username": username,
      "role": role.toString(),
      "accesstoken": accessToken,
      "expiration": expiration,
      "login": login,
      "photoUrl": photoUrl,
    };
  }

  static LogedUserModel fromMap(Map<String, dynamic> map) {
    return LogedUserModel(
      id: map["id"],
      username: map["username"],
      login: map["login"],
      role: RoleType.valueOf(map["role"]),
      accessToken: map["accessToken"],
      expiration: DateTime.parse(map["expiration"]),
      photoUrl: map["photoUrl"],
    );
  }

  static LogedUserModel fromEntity(LogedUserEntity entity) {
    return LogedUserModel(
      id: entity.id,
      username: entity.username,
      login: entity.login,
      role: entity.role,
      accessToken: entity.accessToken,
      expiration: entity.expiration,
      photoUrl: entity.photoUrl,
    );
  }
}
