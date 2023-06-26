import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';
import 'package:tcc_frontend/src/modules/home/domain/usecases/load_services_usecase.dart';
import 'package:tcc_frontend/src/modules/shared/models/filter/filter_entity.dart';

class ServiceController {
  late final ILoadServicesUsecase _loadServicesUsecase;
  final ValueNotifier<bool> loading = ValueNotifier(true);
  final List<ServiceModel> services = [];

  ServiceController({
    required ILoadServicesUsecase loadServiceUsecase,
  }) : _loadServicesUsecase = loadServiceUsecase;

  void loadPage(FilterEntity? filter) async {
    loading.value = true;
    final result = await _loadServicesUsecase.call();

    result.fold((l) => null, (r) {
      services.addAll(r);
      loading.value = false;
    });
  }

  void dispose() {
    services.clear();
  }

  ServiceModel getServices(ServiceModel serviceProvider) {
    return serviceProvider;
  }
}
