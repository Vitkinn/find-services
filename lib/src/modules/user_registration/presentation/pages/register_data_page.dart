import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/core/rest_client/rest_client.dart';
import 'package:tcc_frontend/src/modules/shared/components/app_banner.dart';
import 'package:tcc_frontend/src/modules/shared/components/save_cancel_buttons.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/datasource/remote/user_datasource.dart';
import 'package:tcc_frontend/src/modules/user_registration/data/repositories/user_repository.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/repositories/i_user_repository.dart';
import 'package:tcc_frontend/src/modules/user_registration/domain/usecases/create_user_usecase.dart';
import 'package:tcc_frontend/src/modules/user_registration/presentation/controllers/new_user_controller.dart';

class RegisterDataPage extends StatefulWidget {
  const RegisterDataPage({super.key});

  @override
  State<RegisterDataPage> createState() => _RegisterDataPageState();
}

class _RegisterDataPageState extends State<RegisterDataPage> {
  late final NewUserController _newUserController;
  bool _isChecked = false;

  @override
  void initState() {
    // _newUserController = Modular.get<NewUserController>();
    _newUserController = NewUserController(
        createUserUsecase: CreateUserUsecase(
            repository:
                UserRepository(datasource: UserDatasource(restClient: Modular.get<RestClient>()))));
    super.initState();
  }

  void advance() {
    Modular.to.navigate('/register_photo');
  }

  void cancel() {
    Modular.to.navigate('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const AppBanner(title: 'Cadastrar-se'),
                const SizedBox(height: 50),
                CustomTextField(
                  controller: _newUserController.userNameController,
                  hintText: 'Informe seu nome completo',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _newUserController.emailController,
                  hintText: 'Informe seu e-mail',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _newUserController.phoneController,
                  hintText: 'Informe seu telefone',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _newUserController.cpfController,
                  hintText: 'Informe seu CPF',
                  obscureText: false,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          height: 150,
          child: SaveCancelButtons(
            saveText: 'Avançar',
            cancelText: 'Cancelar',
            onSaveTap: advance,
            onCancelTap: cancel,
          )),
    );
  }
}
