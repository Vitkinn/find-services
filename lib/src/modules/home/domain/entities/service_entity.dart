import 'package:tcc_frontend/src/modules/home/domain/entities/request_status_type.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';

class ServiceEntity {
  final int? id;
  final String? serviceDescription;
  final double? value;
  final double? clientWishValue;
  final String? title;
  final String? valueJustification;
  final RequestStatusType? requestStatus;
  final UserProfileEntity? serviceProvider;
  final UserProfileEntity? serviceRequester;

  ServiceEntity({
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
}
