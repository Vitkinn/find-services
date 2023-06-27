import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/service_requests/data/datasource/i_service_request_datasource.dart';
import 'package:tcc_frontend/src/modules/service_requests/data/models/send_service_request_model.dart';
import 'package:tcc_frontend/src/modules/service_requests/data/models/service_request_model.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/entities/send_service_request_entity.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/repositories/i_user_profile_repository.dart';

class ServiceRequestRepository extends IServiceRequestRepository {
  final IServiceRequestDatasource datasource;

  ServiceRequestRepository({required this.datasource});

  @override
  Future<Either<Failure, ServiceRequestModel>> sendServiceRequest(
      SendServiceRequestEntity entity) async {
    try {
      final result =
          await datasource.sendServiceRequest(SendServiceRequestModel.fromEntity(entity));

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
