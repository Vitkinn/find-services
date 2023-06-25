import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/load_current_user_profile.dart';
import 'package:tcc_frontend/src/modules/profile/domain/usecases/update_user_usecase.dart';
import '../../data/models/profile_edit_model.dart';

class ProfileEditController {
  late final ILoadCurrentUserProfileUsecase _loadCurrentUserProfileUsecase;
  late final IUpdateUserUsecase _updateUserUsecase;

  final userNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();
  final cepController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final cityController = TextEditingController();
  final ufController = TextEditingController();
  final streetController = TextEditingController();
  final numberController = TextEditingController();
  final complementController = TextEditingController();
  final referencePointController = TextEditingController();
  final cnpjController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final citiesController = TextEditingController();
  String? photo;
  bool isServiceProvider = false;

  final GlobalKey<FormState> _userFormState = GlobalKey<FormState>();
  final ValueNotifier<bool> _loading = ValueNotifier(true);

  ProfileEditController({
    required ILoadCurrentUserProfileUsecase loadCurrentUserProfileUsecase,
    required IUpdateUserUsecase updateUserUsecase,
  })  : _loadCurrentUserProfileUsecase = loadCurrentUserProfileUsecase,
        _updateUserUsecase = updateUserUsecase;

  void save() async {
    if (_userFormState.currentState!.validate()) {
      final user = ProfileEditModel(
        name: userNameController.text,
        lastName: lastNameController.text,
        cpf: cpfController.text,
        login: emailController.text,
        phone: phoneController.text,
        photoUrl: null,
      );

      final result = await _updateUserUsecase.call(user);
      result.fold((l) => null, (r) {
        Modular.to.navigate('/profile');
      });
    }
  }

  void cancel() {
    Modular.to.navigate('/profile');
  }

  bool showSaveCancelButtons() {
    return true;
  }

  void toggleServiceProvider(bool value) {
    isServiceProvider = value;
  }

  void loadUserData(bool isServiceProvider) async {
    final result = await _loadCurrentUserProfileUsecase.call();
    result.fold((l) => null, (r) {
      userNameController.text = r.name!;
      lastNameController.text = r.lastName!;
      cpfController.text = r.cpf!;
      emailController.text = r.login!;
      phoneController.text = r.phone!;
      isServiceProvider = false; // Definir como false por padrão
      if (r.photoUrl != null) {
        photo = 'https://storage.googleapis.com${r.photoUrl}';
      }
      _loading.value = false;
    });
  }

  ValueNotifier<bool> get isLoading => _loading;
  GlobalKey<FormState> get userFormState => _userFormState;
}
