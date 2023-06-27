import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/home/domain/entities/service_entity.dart';
import 'package:tcc_frontend/src/modules/home/domain/usecases/load_services_usecase.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';

class ServiceController {
  late final ILoadServicesUsecase _loadServicesUsecase;
  late final List<ServiceEntity> _myRequests = [];
  late final List<ServiceEntity> _myServices = [];
  late ValueNotifier<bool> loading = ValueNotifier(true);

  ServiceController({
    required ILoadServicesUsecase loadServicesUsecase,
  }) : _loadServicesUsecase = loadServicesUsecase;

  void loadPage() {
    _myRequests.clear();
    _myServices.clear();
    loading.value = true;
    loadProfile();
  }

  String getName(UserProfileEntity? user) {
    return '${user?.name} ${user?.lastName}';
  }

  void loadProfile() async {
    final services = await _loadServicesUsecase.call();
    services.fold((l) {
      loading.value = false;
    }, (r) {
      _myRequests.addAll(r.requests!);
      _myServices.addAll(r.services!);
      loading.value = false;
    });
  }

  int getServicesSize() {
    return _myServices.length;
  }

  int getRequestsSize() {
    return _myRequests.length;
  }
}
