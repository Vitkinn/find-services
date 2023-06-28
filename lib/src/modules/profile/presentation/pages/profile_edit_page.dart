import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/controllers/profile_edit_controller.dart';
import 'package:tcc_frontend/src/modules/shared/components/save_cancel_buttons.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_image_picker_controller.dart';
import 'package:tcc_frontend/src/modules/shared/utils/validators.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/app_drawer.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/return_button.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

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

    _profileEditController
        .checkServiceProvider(Modular.args.data?['createServicePrivider'] as bool?);
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
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                          child: ReturnButton(onTap: _profileEditController.cancel),
                        ),
                      ),
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
                      const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                'Dados Pessoais',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
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
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _profileEditController.phoneController,
                        hintText: 'Telefone',
                        keyboardType: TextInputType.number,
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _profileEditController.cpfController,
                        hintText: 'CPF',
                        keyboardType: TextInputType.number,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      // const Align(
                      //   alignment: AlignmentDirectional.centerStart,
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 25.0),
                      //     child: Text(
                      //       'Dados Pessoais',
                      //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
                      // CustomTextField(
                      //   controller: _profileEditController.cepController,
                      //   hintText: 'CEP',
                      //   obscureText: false,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: _profileEditController.neighborhoodController,
                      //   hintText: 'Bairro',
                      //   obscureText: false,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: _profileEditController.cityController,
                      //   hintText: 'Cidade',
                      //   obscureText: false,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: _profileEditController.ufController,
                      //   hintText: 'Estado',
                      //   obscureText: false,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: _profileEditController.streetController,
                      //   hintText: 'Rua',
                      //   obscureText: false,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: _profileEditController.numberController,
                      //   hintText: 'Número',
                      //   obscureText: false,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: _profileEditController.complementController,
                      //   hintText: 'Complemento',
                      //   obscureText: false,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: _profileEditController.referencePointController,
                      //   hintText: 'Ponto de referência',
                      //   obscureText: false,
                      // ),
                      // const SizedBox(height: 30),
                      const SizedBox(height: 30),
                      Visibility(
                        visible: _profileEditController.isServiceProvider,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text(
                                  'Prestador de Serviço',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: _profileEditController.cnpjController,
                              keyboardType: TextInputType.number,
                              hintText: 'CNPJ',
                              obscureText: false,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _profileEditController.descriptionController,
                              hintText: 'Descrição',
                              obscureText: false,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: DropdownButton<Option>(
                                value: _profileEditController.selectedCategory,
                                onChanged: (Option? newValue) {
                                  setState(() {
                                    _profileEditController.selectedCategory = newValue;
                                  });
                                },
                                items: _profileEditController.options
                                    .map<DropdownMenuItem<Option>>((Option option) {
                                  return DropdownMenuItem<Option>(
                                    value: option,
                                    child: Text(option.value),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text(
                                  'Cidades de atuação',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: _profileEditController.citiesController.length,
                              itemBuilder: (context, index) {
                                var controller = _profileEditController.citiesController[index];
                                return Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomTextField(
                                          controller: controller,
                                          hintText: 'Cidade',
                                          obscureText: false,
                                          width: MediaQuery.of(context).size.width * 0.80,
                                        ),
                                        SizedBox(
                                          height: 50,
                                          child: ElevatedButton(
                                            child: Icon(Icons.delete_forever),
                                            onPressed: () {
                                              setState(() {
                                                _profileEditController.citiesController
                                                    .remove(controller);
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: ElevatedButton(
                                child: const Icon(Icons.add_box_sharp),
                                onPressed: () {
                                  setState(() {
                                    _profileEditController.citiesController
                                        .add(TextEditingController());
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
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
    if ((photoUrl == null && loading) ||
        (photoUrl != null && imageFile == null) ||
        (photoUrl == null && imageFile == null)) {
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
