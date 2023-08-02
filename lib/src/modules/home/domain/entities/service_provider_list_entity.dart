import 'package:findservices/src/modules/user_registration/domain/entities/user_entity.dart';

class ServiceProviderEntity {
  final String? id;
  final String? description;
  final String? categoryType;
  final UserEntity? user;

  ServiceProviderEntity({
    this.id,
    this.description,
    this.categoryType,
    this.user,
  });

  ServiceProviderEntity copyWith({
    String? id,
    String? description,
    String? categoryType,
    UserEntity? user,
  }) {
    return ServiceProviderEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      categoryType: categoryType ?? this.categoryType,
      user: user ?? this.user,
    );
  }
}
