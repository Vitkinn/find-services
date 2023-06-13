import 'package:tcc_frontend/src/modules/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.username,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
    };
  }

  static LoginModel fromMap(Map<String, dynamic> map) {
    return LoginModel(
      username: map["username"],
      password: map["password"],
    );
  }

  static LoginModel fromEntity(LoginEntity entity) {
    return LoginModel(
      username: entity.username,
      password: entity.password,
    );
  }
}
