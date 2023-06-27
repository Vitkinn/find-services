import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/entities/send_service_request_entity.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/entities/service_request_entity.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/repositories/i_user_profile_repository.dart';

abstract class IRequestServiceUsecase {
  Future<Either<Failure, ServiceRequestEntity>> call(SendServiceRequestEntity entity);
}

class RequestServiceUsecase extends IRequestServiceUsecase {
  final IServiceRequestRepository repository;

  RequestServiceUsecase({required this.repository});

  @override
  Future<Either<Failure, ServiceRequestEntity>> call(SendServiceRequestEntity entity) async {
    return repository.sendServiceRequest(entity);
  }
}
