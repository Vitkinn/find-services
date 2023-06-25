import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_image_picker_controller.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/impl/auth_controller.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/impl/image_picker_controller.dart';

class SharedModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<IAuthController>((i) => AuthController(), export: true),
        Bind.lazySingleton<IImagePickerController>((i) => ImagePickerController(), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/logout',
          child: (context, args) {
            Modular.get<IAuthController>().logount();
            return const Text('');
          },
        ),
      ];
}
