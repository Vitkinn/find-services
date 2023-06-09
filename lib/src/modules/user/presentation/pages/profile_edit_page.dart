import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/shared/components/custom_button.dart';

import 'package:tcc_frontend/src/modules/shared/components/custom_text_field.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Básico',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 25),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 75,
                          backgroundImage:
                              AssetImage('lib/assets/images/user_icon.png'),
                          backgroundColor: Colors.grey,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: userNameController,
                      hintText: 'Usuário',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'E-mail',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cellPhoneController,
                      hintText: 'Telefone',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cpfController,
                      hintText: 'CPF',
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Alterar a minha senha',
                      style: TextStyle(fontSize: 18, color: Color(0xFF14cd84)),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Endereço',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cepController,
                      hintText: 'CEP',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: neighborhoodController,
                      hintText: 'Bairro',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cityController,
                      hintText: 'Cidade',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: ufController,
                      hintText: 'Estado',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: streetController,
                      hintText: 'Rua',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: numberController,
                      hintText: 'Número',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: complementController,
                      hintText: 'Complemento',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: referencePointController,
                      hintText: 'Ponto de referência',
                      obscureText: false,
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black26,
                    Colors.transparent,
                  ],
                ),
              ), // Cor abaixo do Container do botão
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CustomButton(
                  hintText: 'Salvar',
                  color: '14cd84',
                  onTap: () => {},
                ),
                const SizedBox(height: 10),
                CustomButton(
                  hintText: 'Cancelar',
                  color: '999999',
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const FootBar(),
    );
  }
}
