import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/shared/components/app_banner.dart';
import 'package:tcc_frontend/src/modules/shared/components/save_cancel_buttons.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';
import 'package:tcc_frontend/src/modules/user_registration/presentation/controllers/new_user_controller.dart';

class RegisterDataPage extends StatefulWidget {
  const RegisterDataPage({super.key});

  @override
  State<RegisterDataPage> createState() => _RegisterDataPageState();
}

class _RegisterDataPageState extends State<RegisterDataPage> {
  late final NewUserController _newUserController;

  @override
  void initState() {
    super.initState();
    _newUserController = Modular.get<NewUserController>();

    _newUserController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: _newUserController.formRegisterData,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const AppBanner(title: 'Cadastrar-se'),
                  const SizedBox(height: 50),
                  CustomTextField(
                    controller: _newUserController.nameController,
                    hintText: 'Informe seu nome',
                    requiredField: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _newUserController.lastNameController,
                    hintText: 'Informe seu sobrenome',
                    requiredField: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _newUserController.emailController,
                    hintText: 'Informe seu e-mail',
                    requiredField: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _newUserController.phoneController,
                    hintText: 'Informe seu telefone',
                    obscureText: false,
                    requiredField: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _newUserController.cpfController,
                    hintText: 'Informe seu CPF',
                    obscureText: false,
                    requiredField: true,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Checkbox(
                          isError: true,
                          value: _newUserController.isTermsChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _newUserController.termsChecked = value;
                            });
                          },
                        ),
                        const Flexible(
                          child: Text(
                            'Declaro ter lido e estar de acordo com os termos de uso.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 72.0,
                      bottom: 30,
                      top: 5,
                    ),
                    child: Row(
                      children: [
                        Visibility(
                          visible: (!_newUserController.isTermsChecked) &&
                              _newUserController.isTermsTouched,
                          child: const Flexible(
                            child: Text(
                              'O campo é obrigatório',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: SaveCancelButtons(
                      saveText: 'Avançar',
                      cancelText: 'Cancelar',
                      onSaveTap: _newUserController.registerDataAdvance,
                      onCancelTap: _newUserController.cancel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: SizedBox(
      //     height: 150,
      //     child: SaveCancelButtons(
      //       saveText: 'Avançar',
      //       cancelText: 'Cancelar',
      //       onSaveTap: _newUserController.registerDataAdvance,
      //       onCancelTap: _newUserController.cancel,
      //     )),
    );
  }
}
