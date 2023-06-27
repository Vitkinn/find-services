import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_image_picker_controller.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/impl/auth_controller.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/impl/image_picker_controller.dart';
import 'package:tcc_frontend/src/modules/shared/domain/usecases/get_categories_by_key_usecase.dart';
import 'package:tcc_frontend/src/modules/shared/domain/usecases/get_categories_usecase.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/form_service.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/terms_responsibility.dart';

class SharedModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<IAuthController>((i) => AuthController(), export: true),
        Bind.lazySingleton<IImagePickerController>((i) => ImagePickerController(), export: true),
        Bind.singleton((i) => GetCategoriesUseCase(), export: true),
        Bind.singleton((i) => GetCategoryByKeyUsecase(), export: true),
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
        ChildRoute(
          '/terms_responsability',
          child: (context, args) {
            return TermsResponsibilityPage();
          },
        ),
        ChildRoute(
          '/form_service',
          child: (_, args) => FormServicePage(),
        ),
      ];
}
