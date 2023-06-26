import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:tcc_frontend/src/modules/home/domain/usecases/load_service_providers_usecase.dart';
import 'package:tcc_frontend/src/modules/shared/models/filter/filter_entity.dart';

class HomeController {
  late final ILoadServiceProviderUsecase _loadServiceProviderUsecase;
  final ValueNotifier<bool> loading = ValueNotifier(true);
  final List<ServiceProviderModel> serviceProviders = [];

  HomeController({
    required ILoadServiceProviderUsecase loadServiceProviderUsecase,
  }) : _loadServiceProviderUsecase = loadServiceProviderUsecase;

  void loadPage(FilterEntity? filter) async {
    loading.value = true;
    final result = await _loadServiceProviderUsecase.call(filter ?? FilterEntity());

    result.fold((l) => null, (r) {
      serviceProviders.addAll(r);
      loading.value = false;
    });
  }

  void dispose() {
    serviceProviders.clear();
  }

  String getPhotoUrl(ServiceProviderModel serviceProvider) {
    if (serviceProvider.user?.userPhotoUrl != null) {
      String photo = serviceProvider.user!.userPhotoUrl!;
      return 'https://storage.googleapis.com$photo';
    }
    return '';
  }

  bool hasImage(ServiceProviderModel serviceProvider) {
    return !loading.value && serviceProvider.user?.userPhotoUrl != null;
  }

  void navigateToProfile(String id) {
    Modular.to.navigate('/profile', arguments: {"profilerId": id});
  }
}
