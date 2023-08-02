import 'package:findservices/src/core/rest_client/rest_client.dart';
import 'package:findservices/src/modules/service_requests/data/datasource/i_service_request_datasource.dart';
import 'package:findservices/src/modules/service_requests/data/models/send_service_request_model.dart';
import 'package:findservices/src/modules/service_requests/data/models/service_request_model.dart';

class ServiceRequestDatasource extends IServiceRequestDatasource {
  final RestClient restClient;

  ServiceRequestDatasource({required this.restClient});

  @override
  Future<ServiceRequestModel> sendServiceRequest(
      SendServiceRequestModel entity) async {
    final result = await restClient.post('/api/serviceRequest/create',
        data: entity.toMap());
    return ServiceRequestModel.fromMap(result.data);
  }
}
