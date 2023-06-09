import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/user/data/datasource/i_user_datasource.dart';
import 'package:tcc_frontend/src/modules/user/domain/repositories/i_user_repository.dart';
import 'package:tcc_frontend/src/modules/user/presentation/pages/login_page.dart';
import 'package:tcc_frontend/src/modules/user/presentation/pages/profile_edit_page.dart';
import 'package:tcc_frontend/src/modules/user/presentation/pages/profile_page.dart';
import 'package:tcc_frontend/src/modules/user/presentation/pages/register_data_page.dart';
import 'package:tcc_frontend/src/modules/user/presentation/pages/register_password_page.dart';
import 'package:tcc_frontend/src/modules/user/presentation/pages/register_photo_page.dart';

import 'data/datasource/remote/user_datasource.dart';
import 'data/repositories/user_repository.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        //Datasources
        Bind.lazySingleton<IUserDatasource>((i) => UserDatasource()),
        //Repositories
        Bind.lazySingleton<IUserRepository>(
            (i) => UserRepository(datasource: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        //ChildRoute('/', child: (context, args) => const LoginPage()),
        ChildRoute('/register_data',
            child: (context, args) => const RegisterDataPage()),
        ChildRoute('/register_photo',
            child: (context, args) => const RegisterPhotoPage()),
        ChildRoute('/register_password',
            child: (context, args) => const RegisterPasswordPage()),
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
        ChildRoute('/', child: (context, args) => const ProfileEditPage()),
      ];
}
