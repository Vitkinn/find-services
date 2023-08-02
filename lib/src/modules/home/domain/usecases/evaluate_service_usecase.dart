import 'package:dartz/dartz.dart';
import 'package:findservices/src/core/errors/failure.dart';
import 'package:findservices/src/modules/home/data/models/service_list_model.dart';
import 'package:findservices/src/modules/home/domain/entities/evaluate_service_entity.dart';
import 'package:findservices/src/modules/home/domain/repositories/i_service_page_repository.dart';

abstract class IEvaluateServiceUsecase {
  Future<Either<Failure, ServiceModel>> call(
      String serviceId, EvaluateServiceEntity entity);
}

class EvaluateServiceUsecase extends IEvaluateServiceUsecase {
  final IServicePageRepository repository;

  EvaluateServiceUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ServiceModel>> call(
      String serviceId, EvaluateServiceEntity entity) async {
    return repository.evaluateServiceRequest(serviceId, entity);
  }
}
