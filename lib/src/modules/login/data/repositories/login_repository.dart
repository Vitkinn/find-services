import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/core/errors/failure.dart';
import 'package:tcc_frontend/src/modules/login/data/datasource/i_login_datasource.dart';
import 'package:tcc_frontend/src/modules/login/data/models/loged_user_model.dart';
import 'package:tcc_frontend/src/modules/login/data/models/login_model.dart';
import 'package:tcc_frontend/src/modules/login/domain/repositories/i_login_repository.dart';

class LoginRepository extends ILoginRepository {
  final ILoginDatasource datasource;

  LoginRepository({required this.datasource});

  @override
  Future<Either<Failure, LogedUserModel>> login(LoginModel model) async {
    try {
      final result = await datasource.login(model);

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
