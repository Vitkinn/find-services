import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:tcc_frontend/src/modules/shared/models/filter/filter_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class IHomePageRepository {
  Future<Either<Failure, List<ServiceProviderModel>>> findServiceProfiles(FilterEntity filter);
}
