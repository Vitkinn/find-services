import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.name,
    required super.lastName,
    required super.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "lastName": lastName,
      "photoUrl": photoUrl,
    };
  }

  static UserProfileModel fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      name: map["name"],
      lastName: map["lastName"],
      photoUrl: map["photoUrl"],
    );
  }

  static UserProfileModel fromEntity(UserProfileEntity entity) {
    return UserProfileModel(
      name: entity.name,
      lastName: entity.lastName,
      photoUrl: entity.photoUrl,
    );
  }
}
