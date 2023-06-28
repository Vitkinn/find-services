import 'package:tcc_frontend/src/modules/home/data/models/evaluate_service_model.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';

abstract class IServicesPageDatasource {
  Future<ServicesModel> findServiceSolicitations();
  Future<ServiceModel> evaluateServiceRequest(String serviceId, EvaluateServiceModel model);
}
