import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_edit_entity.dart';

class ProfileEditModel extends ProfileEditEntity {
  ProfileEditModel({
    required super.name,
    required super.lastName,
    required super.photoUrl,
    required super.cpf,
    required super.phone,
    required super.login,
  });

  static ProfileEditModel fromMap(Map<String, dynamic> map) {
    return ProfileEditModel(
      name: map["name"],
      lastName: map["lastName"],
      phone: map["phone"],
      photoUrl: map["userPhotoUrl"],
      cpf: map["cpf"],
      login: map["login"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "lastName": lastName,
      "phone": phone,
      "userPhotoUrl": photoUrl,
      "cpf": cpf,
      "login": login,
    };
  }

  static ProfileEditModel fromEntity(ProfileEditEntity entity) {
    return ProfileEditModel(
      name: entity.name,
      lastName: entity.lastName,
      login: entity.login,
      cpf: entity.cpf,
      phone: entity.phone,
      photoUrl: entity.photoUrl,
    );
  }
}
