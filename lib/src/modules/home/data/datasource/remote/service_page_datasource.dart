import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/home/data/datasource/i_service_page_datasource.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';

class ServicePageDatasource extends IServicesPageDatasource {
  final RestClient restClient;

  ServicePageDatasource({required this.restClient});

  @override
  Future<ServicesModel> findServiceSolicitations() async {
    final result = await restClient.get('/api/serviceRequest');
    return ServicesModel.fromMap(result.data);
  }
}
