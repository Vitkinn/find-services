import 'package:tcc_frontend/src/modules/home/domain/entities/service_entity.dart';
import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';

class ServicesModel extends ServicesEntity {
  ServicesModel({
    required super.services,
    required super.requests,
  });

  static ServicesModel fromMap(Map<String, dynamic> map) {
    List services = map["myServices"];
    List<ServiceModel> mapedServices =
        services.map((service) => ServiceModel.fromMap(service)).toList();
    List requests = map["myRequests"];
    List<ServiceModel> mapedRequests =
        requests.map((request) => ServiceModel.fromMap(request)).toList();

    return ServicesModel(
      services: mapedServices,
      requests: mapedRequests,
    );
  }
}

class ServiceModel extends ServiceEntity {
  ServiceModel({
    required super.id,
    required super.description,
    required super.value,
    required super.createDate,
    required super.clientWishValue,
    required super.title,
    required super.valueJustification,
    required super.requestStatus,
    required super.provider,
    required super.requester,
  });

  static ServiceModel fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map["id"],
      description: map["serviceDescription"],
      createDate: map["createDate"] != null ? DateTime.tryParse(map["createDate"]) : null,
      value: map["value"],
      clientWishValue: map["clientWishValue"],
      title: map["title"],
      valueJustification: map["valueJustification"],
      requestStatus: map["requestStatus"],
      provider: UserProfileModel.fromMap(map["serviceProvider"]),
      requester: UserProfileModel.fromMap(map["serviceRequester"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "serviceDescription": description,
      "value": value,
      "clientWishValue": clientWishValue,
      "title": title,
      "createDate": createDate,
      "valueJustification": valueJustification,
      "requestStatus": requestStatus,
      "serviceProvider": UserProfileModel.fromEntity(provider!).toMap(),
      "serviceRequester": UserProfileModel.fromEntity(requester!).toMap(),
    };
  }

  static ServiceModel fromEntity(ServiceEntity entity) {
    return ServiceModel(
      id: entity.id,
      description: entity.description,
      value: entity.value,
      clientWishValue: entity.clientWishValue,
      createDate: entity.createDate,
      title: entity.title,
      valueJustification: entity.valueJustification,
      requestStatus: entity.requestStatus,
      provider: UserProfileModel.fromEntity(entity.provider!),
      requester: UserProfileModel.fromEntity(entity.requester!),
    );
  }
}
