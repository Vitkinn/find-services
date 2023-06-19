import 'package:tcc_frontend/src/modules/user_registration/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.lastName,
    required super.login,
    required super.password,
    required super.cpf,
    required super.number,
    required super.complement,
    required super.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "lastName": lastName,
      "login": login,
      "password": password,
      "cep": cpf,
      "number": number,
      "complement": complement,
      "phone": phone
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      lastName: map["lastName"],
      login: map["login"],
      password: map["password"],
      cpf: map["cpf"],
      number: map["number"],
      complement: map["complement"],
      phone: map["phone"],
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      lastName: entity.lastName,
      login: entity.login,
      password: entity.password,
      cpf: entity.cpf,
      number: entity.number,
      complement: entity.complement,
      phone: entity.phone,
    );
  }
}
