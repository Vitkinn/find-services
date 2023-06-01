import 'package:flutter/material.dart';
import 'package:tcc_frontend/shared/components/custom_button.dart';
import '../../../../../shared/components/custom_text_field.dart';

class RegisterPasswordPage extends StatefulWidget {
  dynamic data;

  RegisterPasswordPage(this.data, {super.key});

  @override
  State<RegisterPasswordPage> createState() => _RegisterPasswordPageState(data);
}

class _RegisterPasswordPageState extends State<RegisterPasswordPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final dynamic data;

  _RegisterPasswordPageState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 25),
                Image.asset(
                  'lib/assets/images/FindServices.png',
                  height: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Cadastrar-se',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: userNameController,
                  hintText: 'Informe seu nome completo',
                  obscureText: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
