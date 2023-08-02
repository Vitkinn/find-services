import 'package:findservices/src/modules/home/domain/entities/service_provider_list_entity.dart';
import 'package:findservices/src/modules/user_registration/data/models/user_model.dart';

class ServiceProviderModel extends ServiceProviderEntity {
  ServiceProviderModel({
    required super.id,
    required super.description,
    required super.categoryType,
    required super.user,
  });

  static ServiceProviderModel fromMap(Map<String, dynamic> map) {
    return ServiceProviderModel(
      id: map["id"],
      description: map["description"],
      categoryType: map["categoryType"],
      user: UserModel.fromMap(map["user"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "description": description,
      "categoryType": categoryType,
      "user": UserModel.fromEntity(user!).toMap(),
    };
  }

  static ServiceProviderModel fromEntity(ServiceProviderEntity entity) {
    return ServiceProviderModel(
      id: entity.id,
      description: entity.description,
      categoryType: entity.categoryType,
      user: UserModel.fromEntity(entity.user!),
    );
  }
}
