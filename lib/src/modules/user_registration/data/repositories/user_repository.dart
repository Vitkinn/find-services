import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/models/user_model.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/repositories/i_user_repository.dart';

import '../datasource/i_user_datasource.dart';

class UserRepository extends IUserRepository {
  late final IUserDatasource datasource;

  UserRepository({required this.datasource});

  @override
  Future<Either<Failure, Unit>> createUser(UserModel model) async {
    try {
      await datasource.createUser(model);

      return right(unit);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> listUsers() async {
    try {
      final result = await datasource.listUsers();

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
