import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileEditController {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final cellPhoneController = TextEditingController();
  final cpfController = TextEditingController();
  final cepController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final cityController = TextEditingController();
  final ufController = TextEditingController();
  final streetController = TextEditingController();
  final numberController = TextEditingController();
  final complementController = TextEditingController();
  final referencePointController = TextEditingController();

  void save() {
    Modular.to.navigate('/profile');
  }

  void cancel() {
    Modular.to.navigate('/profile');
  }

  bool showSaveCancelButtons() {
    return true;
  }
}
