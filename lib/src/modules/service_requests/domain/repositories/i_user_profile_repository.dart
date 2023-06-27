import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/modules/service_requests/data/models/service_request_model.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/entities/send_service_request_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class IServiceRequestRepository {
  Future<Either<Failure, ServiceRequestModel>> sendServiceRequest(SendServiceRequestEntity entity);
}
