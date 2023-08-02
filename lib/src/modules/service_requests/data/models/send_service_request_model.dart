import 'package:findservices/src/modules/service_requests/domain/entities/send_service_request_entity.dart';

class SendServiceRequestModel extends SendServiceRequestEntity {
  SendServiceRequestModel({
    required super.serviceDescription,
    required super.clientWishValue,
    required super.serviceProviderId,
    required super.title,
  });

  Map<String, dynamic> toMap() {
    return {
      "serviceDescription": serviceDescription,
      "clientWishValue": clientWishValue,
      "title": title,
      "serviceProvider": {"id": serviceProviderId},
    };
  }

  static SendServiceRequestModel fromEntity(SendServiceRequestEntity entity) {
    return SendServiceRequestModel(
      serviceDescription: entity.serviceDescription,
      clientWishValue: entity.clientWishValue,
      serviceProviderId: entity.serviceProviderId,
      title: entity.title,
    );
  }
}
