import 'package:flutter/material.dart';

import 'package:tcc_frontend/shared/components/app_banner.dart';
import 'package:tcc_frontend/shared/components/custom_button.dart';
import 'package:tcc_frontend/shared/components/custom_text_field.dart';

class RegisterDataPage extends StatefulWidget {
  dynamic data;

  RegisterDataPage(this.data, {super.key});

  @override
  State<RegisterDataPage> createState() => _RegisterDataPageState(data);
}

class _RegisterDataPageState extends State<RegisterDataPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final dynamic data;
  bool _isChecked = false;

  _RegisterDataPageState(this.data);

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
                const AppBanner(title: 'Cadastrar-se'),
                const SizedBox(height: 25),
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
                  hintText: 'Confirme seu e-mail',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Informe seu CPF',
                  obscureText: false,
                ),
                const SizedBox(height: 40),
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
                const SizedBox(height: 40),
                CustomButton(
                  onTap: () => {},
                  hintText: 'Avançar',
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onTap: () => {},
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
