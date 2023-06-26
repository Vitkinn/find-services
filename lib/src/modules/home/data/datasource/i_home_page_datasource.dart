import 'package:tcc_frontend/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:tcc_frontend/src/modules/shared/models/filter/filter_model.dart';

abstract class IHomePageDatasource {
  Future<List<ServiceProviderModel>> findServiceProviders(FilterModel filter);
}
