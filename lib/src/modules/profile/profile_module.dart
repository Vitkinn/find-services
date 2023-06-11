import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/data/datasource/remote/user_profile_datasource.dart';
import 'package:tcc_frontend/src/modules/profile/data/repositories/user_profile_repository.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_profile_usecase.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/controllers/profile_controller.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/controllers/profile_edit_controller.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/pages/profile_edit_page.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [
        // Datasource
        Bind.lazySingleton((i) => UserProfileDatasource(restClient: i.get())),
        // Repository
        Bind.lazySingleton((i) => UserProfileRepository(datasource: i.get())),
        // Usecase
        Bind.lazySingleton((i) => LoadProfileUsecase(
              repository: i.get(),
              authController: i.get(),
            )),
        // Controller
        Bind.lazySingleton(
            (i) => ProfileController(loadProfileUsercase: i.get())),
        Bind.lazySingleton((i) => ProfileEditController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
        ChildRoute('/profile_edit',
            child: (context, args) => const ProfileEditPage()),
      ];
}
