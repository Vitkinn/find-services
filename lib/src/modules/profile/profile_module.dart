import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/pages/profile_edit_page.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
        ChildRoute('/profile_edit',
            child: (context, args) => const ProfileEditPage()),
      ];
}
