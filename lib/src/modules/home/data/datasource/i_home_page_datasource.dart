import 'package:findservices/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:findservices/src/modules/shared/models/filter/filter_model.dart';

abstract class IHomePageDatasource {
  Future<List<ServiceProviderModel>> findServiceProviders(FilterModel filter);
}
