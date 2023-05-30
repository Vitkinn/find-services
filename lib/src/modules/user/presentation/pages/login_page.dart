import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/shared/components/custom_button.dart';
import '../../../../../shared/components/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void sign() {
    Modular.to.navigate('register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'lib/assets/images/FindServices.png',
                  height: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 75),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Usuário',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 50),
                CustomButton(
                  onTap: () => {sign()},
                  hintText: 'Entrar',
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ainda não tem uma conta?',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Registre-se aqui',
                      style: TextStyle(fontSize: 18, color: Color(0xFF14cd84)),
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
