import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:tcc_frontend/shared/components/app_banner.dart';
import 'package:tcc_frontend/shared/components/custom_button.dart';
import '../../../../../shared/components/custom_text_field.dart';

class RegisterPasswordPage extends StatefulWidget {
  const RegisterPasswordPage({super.key});

  @override
  State<RegisterPasswordPage> createState() => _RegisterPasswordPageState();
}

class _RegisterPasswordPageState extends State<RegisterPasswordPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void advance() {
    Modular.to.navigate('/register_password');
  }

  void cancel() {
    Modular.to.navigate('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: AppBanner(
                      title: 'Por fim, vamos definir a sua senha!',
                      titleSize: 18,
                      titleHexColor: '808080'),
                ),
                const SizedBox(height: 120),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Informe a sua senha',
                  obscureText: false,
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    '(Deve ter no mínimo 8 dígito e conter '
                    'pelo menos uma letra, um número e um caractere especial.)',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Confirme a sua senha',
                  obscureText: false,
                ),
                const SizedBox(height: 120),
                CustomButton(
                  onTap: () => {advance()},
                  hintText: 'Finalizar',
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onTap: () => {cancel()},
                  hintText: 'Cancelar',
                  hexColor: '999999',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
