import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/controllers/profile_edit_controller.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';
import 'package:tcc_frontend/src/modules/shared/components/save_cancel_buttons.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_image_picker_controller.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/app_drawer.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/return_button.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late final ProfileEditController _profileEditController;
  late final IImagePickerController _imagePickerController;

  @override
  void initState() {
    super.initState();

    _profileEditController = Modular.get<ProfileEditController>();
    _imagePickerController = Modular.get<IImagePickerController>();

    _profileEditController.loadUserData();
    _profileEditController.isLoading.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            title: const Text('FindServices'),
            actions: [GestureDetector(child: Icon(Icons.chat))],
            elevation: 0,
          ),
          drawer: const AppDrawer(),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Form(
                  key: _profileEditController.userFormState,
                  child: Column(
                    children: [
                      const SizedBox(height: 35),
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
                          GestureDetector(
                            onTap: () {},
                            child: GestureDetector(
                              onTap: () {
                                _imagePickerController.dialogBuilder(context).then((value) {
                                  setState(() {
                                    _profileEditController.image = _imagePickerController.image();
                                  });
                                });
                              },
                              child: ImageLoading(
                                loading: _profileEditController.isLoading.value,
                                radius: 75,
                                photoUrl: _profileEditController.photoUrl,
                                imageFile: _profileEditController.image,
                              ),
                            ),
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
                      const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Endereços',
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
        ),
        if (_profileEditController.isLoading.value)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_profileEditController.isLoading.value)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}

class ImageLoading extends StatelessWidget {
  final bool loading;
  final String? photoUrl;
  final double radius;
  final File? imageFile;

  const ImageLoading({
    super.key,
    this.photoUrl,
    this.imageFile,
    required this.radius,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    if ((photoUrl == null && loading) || (photoUrl != null && imageFile == null)) {
      return Visibility(
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
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundImage: FileImage(imageFile!),
      backgroundColor: Colors.grey,
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
