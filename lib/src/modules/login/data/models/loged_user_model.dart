import 'package:tcc_frontend/src/modules/login/domain/entities/loged_user_entity.dart';

class LogedUserModel extends LogedUserEntity {
  LogedUserModel({
    required super.username,
    required super.role,
    required super.accessToken,
    required super.expiration,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "role": role,
      "accesstoken": accessToken,
      "expiration": expiration,
    };
  }

  static LogedUserModel fromMap(Map<String, dynamic> map) {
    return LogedUserModel(
      username: map["login"],
      role: map["role"],
      accessToken: map["accessToken"],
      expiration: map["expiration"],
    );
  }

  static LogedUserModel fromEntity(LogedUserEntity entity) {
    return LogedUserModel(
      username: entity.username,
      role: entity.role,
      accessToken: entity.accessToken,
      expiration: entity.expiration,
    );
  }
}
