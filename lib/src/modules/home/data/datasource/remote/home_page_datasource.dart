import 'package:findservices/src/core/rest_client/rest_client.dart';
import 'package:findservices/src/modules/home/data/datasource/i_home_page_datasource.dart';
import 'package:findservices/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:findservices/src/modules/shared/models/filter/filter_model.dart';

class HomePageDatasource extends IHomePageDatasource {
  final RestClient restClient;

  HomePageDatasource({required this.restClient});

  @override
  Future<List<ServiceProviderModel>> findServiceProviders(
      FilterModel filter) async {
    final result = await restClient.post('/api/serviceProvider/search',
        data: filter.toMap());
    return (result.data as List)
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
  }
}
