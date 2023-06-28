import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/datasource/i_user_datasource.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/repositories/i_user_repository.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/usecases/create_user_usecase.dart';
import 'package:tcc_frontend/src/modules/user_registration/presentation/controllers/new_user_controller.dart';
import 'package:tcc_frontend/src/modules/user_registration/presentation/pages/register_data_page.dart';
import 'package:tcc_frontend/src/modules/user_registration/presentation/pages/register_password_page.dart';
import 'package:tcc_frontend/src/modules/user_registration/presentation/pages/register_photo_page.dart';

import 'data/datasource/remote/user_datasource.dart';
import 'data/repositories/user_repository.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        //Datasources
        Bind.lazySingleton<IUserDatasource>((i) => UserDatasource(restClient: i.get<RestClient>())),
        //Repositories
        Bind.lazySingleton<IUserRepository>((i) => UserRepository(datasource: i.get())),
        //Usercases
        Bind.lazySingleton<ICreateUserUsecase>((i) => CreateUserUsecase(
              repository: i.get(),
              imageCompressController: i.get(),
            )),
        // Controllers
        Bind.lazySingleton<NewUserController>(
          (i) => NewUserController(createUserUsecase: i.get()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/register_data',
          child: (context, args) => const RegisterDataPage(),
        ),
        ChildRoute(
          '/register_photo',
          child: (context, args) => const RegisterPhotoPage(),
        ),
        ChildRoute(
          '/register_password',
          child: (context, args) => const RegisterPasswordPage(),
        ),
      ];
}
