import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/home/data/datasource/i_services_page_datasource.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';

class ServicePageDatasource extends IServicesPageDatasource {
  final RestClient restClient;

  ServicePageDatasource({required this.restClient});

  @override
  Future<List<ServiceModel>> findServiceSolicitations() async {
    final result = await restClient.post('/api/serviceRequest');
    return (result.data as List).map((e) => ServiceModel.fromMap(e)).toList();
  }
}
