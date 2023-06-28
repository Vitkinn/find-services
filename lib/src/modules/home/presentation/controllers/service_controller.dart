import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  String? getRequestTitle(int index) {
    return _myRequests[index].title;
  }

  String? getRequestDescription(int index) {
    return _myRequests[index].description;
  }

  String? getRequester(int index) {
    if (_myRequests[index].requester != null) {
      return _myRequests[index].requester!.name;
    }
    return null;
  }

  String? getProvider(int index) {
    if (_myRequests[index].provider != null) {
      return _myRequests[index].provider!.name;
    }
    return null;
  }

  String? getRequestDate(int index) {
    return '01/01/2023';
  }

  Color getRequestTypeColor(int index) {
    switch (_myRequests[index].requestStatus) {
      case 'PENDING_SERVICE_ACCEPT':
        return Colors.yellow;
      case 'PENDING_SERVICE_APPROVED':
        return Colors.blue;
      case 'APPROVED':
        return Colors.green;
      case 'CANCELED':
        return Colors.grey;
      case 'SERVICE_REJECTED':
        return Colors.red;
      case 'DONE':
        return Colors.lightGreen;
      default:
        return Colors.white;
    }
  }

  int getRequestsSize() {
    return _myRequests.length;
  }

  void toDetailView(int index) {
    Modular.to.navigate('/view_request', arguments: {"serviceRequest": _myRequests[index]});
  }
}
