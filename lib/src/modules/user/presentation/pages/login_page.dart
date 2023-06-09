import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/shared/components/app_banner.dart';

import 'package:tcc_frontend/src/modules/shared/components/custom_button.dart';
import 'package:tcc_frontend/src/modules/shared/components/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void sign() {}

  void register() {
    Modular.to.navigate('register_data');
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
                const AppBanner(title: 'Entrar'),
                const SizedBox(height: 100),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Usuário',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Esqueceu sua senha?',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF14cd84)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                CustomButton(
                  hintText: 'Entrar',
                  color: '14cd84',
                  onTap: () => {sign()},
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ainda não tem uma conta?',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      child: const Text(
                        'Registre-se aqui',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF14cd84)),
                      ),
                      onTap: () => {register()},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
