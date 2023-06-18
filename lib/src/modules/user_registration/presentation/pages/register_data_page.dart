import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/shared/components/app_banner.dart';
import 'package:tcc_frontend/src/modules/shared/components/save_cancel_buttons.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';

class RegisterDataPage extends StatefulWidget {
  const RegisterDataPage({super.key});

  @override
  State<RegisterDataPage> createState() => _RegisterDataPageState();
}

class _RegisterDataPageState extends State<RegisterDataPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isChecked = false;

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
                  controller: userNameController,
                  hintText: 'Informe seu nome completo',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Informe seu e-mail',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Informe seu telefone',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
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
