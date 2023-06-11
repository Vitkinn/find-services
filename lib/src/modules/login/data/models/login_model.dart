import 'package:tcc_frontend/src/modules/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.login,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "login": login,
      "password": password,
    };
  }

  static LoginModel fromMap(Map<String, dynamic> map) {
    return LoginModel(
      login: map["login"],
      password: map["password"],
    );
  }

  static LoginModel fromEntity(LoginEntity entity) {
    return LoginModel(
      login: entity.login,
      password: entity.password,
    );
  }
}
