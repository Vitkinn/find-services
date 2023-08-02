import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:findservices/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:findservices/src/modules/home/domain/usecases/load_service_providers_usecase.dart';
import 'package:findservices/src/modules/shared/domain/usecases/get_categories_by_key_usecase.dart';
import 'package:findservices/src/modules/shared/models/filter/filter_entity.dart';

class HomeController {
  late final ILoadServiceProviderUsecase _loadServiceProviderUsecase;
  late final GetCategoryByKeyUsecase _getCategoryByKeyUsecase;
  final ValueNotifier<bool> loading = ValueNotifier(true);
  final List<ServiceProviderModel> serviceProviders = [];
  final filterController = TextEditingController();

  FilterEntity? filter;

  HomeController({
    required ILoadServiceProviderUsecase loadServiceProviderUsecase,
    required GetCategoryByKeyUsecase getCategoryByKeyUsecase,
  })  : _loadServiceProviderUsecase = loadServiceProviderUsecase,
        _getCategoryByKeyUsecase = getCategoryByKeyUsecase;

  void loadPage(FilterEntity? filter) async {
    serviceProviders.clear();
    loading.value = true;
    this.filter = filter;
    final result =
        await _loadServiceProviderUsecase.call(filter ?? FilterEntity());

    result.fold((l) => null, (r) {
      serviceProviders.addAll(r);
      loading.value = false;
    });
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

  translateCategory(ServiceProviderModel serviceProvider) {
    return _getCategoryByKeyUsecase.call(serviceProvider.categoryType!);
  }

  String? getFilterName() {
    if (filter != null && filter?.category != null) {
      return _getCategoryByKeyUsecase.call(filter!.category!);
    } else {
      return null;
    }
  }

  void clearCategory() {
    loadPage(FilterEntity(
      name: filter?.name,
      category: null,
      city: filter?.city,
    ));
  }

  void filterByName() {
    filter = filter != null
        ? filter!.copyWith(
            name: filterController.text,
            category: filter?.category,
            city: filter?.city)
        : FilterEntity(name: filterController.text);

    loadPage(filter);
  }
}
