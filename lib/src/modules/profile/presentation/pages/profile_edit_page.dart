import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/controllers/profile_edit_controller.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';
import 'package:tcc_frontend/src/modules/shared/components/save_cancel_buttons.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/return_button.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late final ProfileEditController _profileEditController;

  @override
  void initState() {
    super.initState();

    _profileEditController = Modular.get<ProfileEditController>();
    _profileEditController.loadUserData();
    _profileEditController.isLoading.addListener(() {
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
              key: _profileEditController.userFormState,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      children: [
                        ReturnButton(onTap: _profileEditController.cancel),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Básico',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ImageLoading(
                        loading: _profileEditController.isLoading.value,
                        radius: 75,
                        photoUrl: _profileEditController.photo,
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
                    controller: _profileEditController.userNameController,
                    hintText: 'Nome',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.lastNameController,
                    hintText: 'Sobrenome',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.phoneController,
                    hintText: 'Telefone',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.cpfController,
                    hintText: 'CPF',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Alterar a minha senha',
                    style: TextStyle(fontSize: 18, color: Color(0xFF14cd84)),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Endereço',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _profileEditController.cepController,
                    hintText: 'CEP',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.neighborhoodController,
                    hintText: 'Bairro',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.cityController,
                    hintText: 'Cidade',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.ufController,
                    hintText: 'Estado',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.streetController,
                    hintText: 'Rua',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.numberController,
                    hintText: 'Número',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.complementController,
                    hintText: 'Complemento',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _profileEditController.referencePointController,
                    hintText: 'Ponto de referência',
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  Visibility(
                      visible: _profileEditController.showSaveCancelButtons(),
                      child: SizedBox(
                          height: 120,
                          child: SaveCancelButtons(
                            onSaveTap: _profileEditController.save,
                            onCancelTap: _profileEditController.cancel,
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FootBar(initialIndex: 2),
    );
  }
}

typedef ImageBuild = ImageProvider Function(String? photoUrl);

class ImageLoading extends StatelessWidget {
  final bool loading;
  final String? photoUrl;
  final double radius;

  const ImageLoading({
    super.key,
    this.photoUrl,
    required this.radius,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.navigate("/profile_edit");
      },
      child: Visibility(
        visible: !loading,
        replacement: CircleAvatar(
          radius: radius,
          backgroundImage: const AssetImage('lib/assets/images/user_icon.png'),
          backgroundColor: Colors.grey,
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: getImage(photoUrl),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }

  ImageProvider getImage(String? photoUrl) {
    if (photoUrl != null && photoUrl != "") {
      var imageUrl = 'https://storage.googleapis.com${photoUrl!}';
      return NetworkImage(imageUrl);
    }
    return const AssetImage('lib/assets/images/user_icon.png');
  }
}
