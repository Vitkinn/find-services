import 'package:tcc_frontend/src/modules/profile/data/models/user_profile_model.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/entities/service_request_entity.dart';

class ServiceRequestModel extends ServiceRequestEntity {
  ServiceRequestModel({
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

  static ServiceRequestModel fromMap(Map<String, dynamic> map) {
    var serviceRequester =
        map["serviceRequester"] != null ? UserProfileModel.fromMap(map["serviceRequester"]) : null;
    var serviceProvider =
        map["serviceRequester"] != null ? UserProfileModel.fromMap(map["serviceProvider"]) : null;
    return ServiceRequestModel(
      id: map["id"],
      serviceDescription: map["serviceDescription"],
      value: map["value"],
      clientWishValue: map["clientWishValue"],
      title: map["title"],
      valueJustification: map["valueJustification"],
      requestStatus: map["requestStatus"],
      serviceProvider: serviceRequester,
      serviceRequester: serviceProvider,
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
      "serviceProvider": serviceProvider,
      "serviceRequester": serviceRequester,
    };
  }

  static ServiceRequestModel fromEntity(ServiceRequestEntity entity) {
    return ServiceRequestModel(
      id: entity.id,
      serviceDescription: entity.serviceDescription,
      value: entity.value,
      clientWishValue: entity.clientWishValue,
      title: entity.title,
      valueJustification: entity.valueJustification,
      requestStatus: entity.requestStatus,
      serviceProvider: entity.serviceProvider,
      serviceRequester: entity.serviceRequester,
    );
  }
}
