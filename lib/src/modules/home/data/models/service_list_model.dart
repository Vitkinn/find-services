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
    required super.serviceDescription,
    required super.value,
    required super.clientWishValue,
    required super.title,
    required super.valueJustification,
    required super.requestStatus,
    required super.serviceProvider,
    required super.serviceRequester,
  });

  static ServiceModel fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map["id"],
      serviceDescription: map["serviceDescription"],
      value: map["value"],
      clientWishValue: map["clientWishValue"],
      title: map["title"],
      valueJustification: map["valueJustification"],
      requestStatus: map["requestStatus"],
      serviceProvider: UserProfileModel.fromMap(map["serviceProvider"]),
      serviceRequester: UserProfileModel.fromMap(map["serviceRequester"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "serviceDescription": serviceDescription,
      "value": value,
      "clientWishValue": clientWishValue,
      "title": title,
      "valueJustification": valueJustification,
      "requestStatus": requestStatus,
      "serviceProvider": UserProfileModel.fromEntity(serviceProvider!).toMap(),
      "serviceRequester":
          UserProfileModel.fromEntity(serviceRequester!).toMap(),
    };
  }

  static ServiceModel fromEntity(ServiceEntity entity) {
    return ServiceModel(
      id: entity.id,
      serviceDescription: entity.serviceDescription,
      value: entity.value,
      clientWishValue: entity.clientWishValue,
      title: entity.title,
      valueJustification: entity.valueJustification,
      requestStatus: entity.requestStatus,
      serviceProvider: UserProfileModel.fromEntity(entity.serviceProvider!),
      serviceRequester: UserProfileModel.fromEntity(entity.serviceRequester!),
    );
  }
}
