import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';

import '../../../../core/errors/failure.dart';

abstract class IServicePageRepository {
  Future<Either<Failure, ServicesModel>> findServices();
}
