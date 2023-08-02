import 'package:findservices/src/modules/profile/domain/entities/user_profile_entity.dart';

class ServicesEntity {
  final List<ServiceEntity>? services;
  final List<ServiceEntity>? requests;

  ServicesEntity({
    this.services,
    this.requests,
  });
}

class ServiceEntity {
  final String? id;
  final String? description;
  final double? value;
  final double? clientWishValue;
  final String? title;
  final String? valueJustification;
  final DateTime? createDate;
  final String? requestStatus;
  final UserProfileEntity? provider;
  final UserProfileEntity? requester;

  ServiceEntity({
    this.id,
    this.description,
    this.value,
    this.createDate,
    this.clientWishValue,
    this.title,
    this.valueJustification,
    this.requestStatus,
    this.provider,
    this.requester,
  });
}
