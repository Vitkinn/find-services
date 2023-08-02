import 'package:findservices/src/modules/home/data/models/evaluate_service_model.dart';
import 'package:findservices/src/modules/home/data/models/service_list_model.dart';

abstract class IServicesPageDatasource {
  Future<ServicesModel> findServiceSolicitations();
  Future<ServiceModel> evaluateServiceRequest(
      String serviceId, EvaluateServiceModel model);
  Future<void> rejectService(String serviceId);
  Future<void> cancelService(String serviceId);
  Future<void> acceptService(String serviceId);
  Future<void> finishService(String serviceId);
}
