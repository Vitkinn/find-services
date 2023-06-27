import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';

class ServiceRequestEntity {
  String? id;
  String? serviceDescription;
  double? value;
  double? clientWishValue;
  String? title;
  String? valueJustification;
  String? requestStatus;
  UserProfileEntity? serviceProvider;
  UserProfileEntity? serviceRequester;

  ServiceRequestEntity({
    this.id,
    this.serviceDescription,
    this.value,
    this.clientWishValue,
    this.title,
    this.valueJustification,
    this.requestStatus,
    this.serviceProvider,
    this.serviceRequester,
  });

  ServiceRequestEntity copyWith({
    String? id,
    String? serviceDescription,
    double? value,
    double? clientWishValue,
    String? title,
    String? valueJustification,
    String? requestStatus,
    UserProfileEntity? serviceProvider,
    UserProfileEntity? serviceRequester,
  }) {
    return ServiceRequestEntity(
      id: id ?? this.id,
      serviceDescription: serviceDescription ?? this.serviceDescription,
      value: value ?? this.value,
      clientWishValue: clientWishValue ?? this.clientWishValue,
      title: title ?? this.title,
      valueJustification: valueJustification ?? this.valueJustification,
      requestStatus: requestStatus ?? this.requestStatus,
      serviceProvider: serviceProvider ?? this.serviceProvider,
      serviceRequester: serviceRequester ?? this.serviceRequester,
    );
  }
}
