import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_list_model.dart';
import 'package:tcc_frontend/src/modules/home/domain/entities/evaluate_service_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class IServicePageRepository {
  Future<Either<Failure, ServicesModel>> findServices();
  Future<Either<Failure, ServiceModel>> evaluateServiceRequest(
      String serviceId, EvaluateServiceEntity entity);
  Future<Either<Failure, void>> rejectService(String serviceId);
  Future<Either<Failure, void>> cancelService(String serviceId);
  Future<Either<Failure, void>> acceptService(String serviceId);
  Future<Either<Failure, void>> finishService(String serviceId);
}
