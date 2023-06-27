import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';

abstract class IServicesPageDatasource {
  Future<ServicesModel> findServiceSolicitations();
}
