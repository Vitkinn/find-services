import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/shared/components/app_banner.dart';
import 'package:tcc_frontend/src/modules/shared/components/save_cancel_buttons.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_image_picker_controller.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_button.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/return_button.dart';
import 'package:tcc_frontend/src/modules/user_registration/presentation/controllers/new_user_controller.dart';

class RegisterPhotoPage extends StatefulWidget {
  const RegisterPhotoPage({super.key});

  @override
  State<RegisterPhotoPage> createState() => _RegisterPhotoPageState();
}

class _RegisterPhotoPageState extends State<RegisterPhotoPage> {
  late final NewUserController _newUserController;
  late final IImagePickerController _imagePickerController;
  late final String _profilePictureUrl = 'lib/assets/images/user_icon.png';
  String? _selectedOption;

  final List<String> _options = [
    '---',
    'Masculino',
    'Feminino',
    'Prefiro não definir',
  ];

  @override
  void initState() {
    super.initState();
    _newUserController = Modular.get<NewUserController>();
    _imagePickerController = Modular.get<IImagePickerController>();
    _newUserController.image.addListener(() {
      setState(() {});
    });
  }

  void advance() {
    Modular.to.navigate('/register_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      children: [
                        ReturnButton(onTap: _newUserController.cancel),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: AppBanner(
                    title:
                        'Por favor, agora selecione uma foto para o seu perfil e defina o seu sexo.',
                    titleSize: 18,
                    titleHexColor: '808080',
                  ),
                ),
                const SizedBox(height: 50),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _imagePickerController.dialogBuilder(context).then((value) {
                          _newUserController.image.value = _imagePickerController.image();
                        });
                      },
                      child: ImageLoading(
                        radius: 75,
                        file: _newUserController.image.value,
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
                        onPressed: () {
                          // Lógica para trocar a foto
                          // Implemente a lógica de seleção de imagem aqui
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonFormField(
                      value: _selectedOption,
                      isExpanded: true,
                      decoration: InputDecoration(
                          hintText: 'Selecione o seu sexo',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                      items: _options.map((String option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue;
                        });
                      },
                    ),
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
            onSaveTap: advance,
            onCancelTap: _newUserController.cancel,
          )),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            Column(
              children: [
                const SizedBox(height: 10),
                CustomButton(
                  padding: 5,
                  onTap: () {
                    _newUserController
                        .pickImageFromGallery()
                        .then((value) => Navigator.pop(context, false));
                  },
                  color: '14cd84',
                  hintText: 'Galeria',
                ),
                const SizedBox(height: 10),
                CustomButton(
                  padding: 5,
                  color: '14cd84',
                  onTap: () {
                    _newUserController
                        .pickImageFromCamera()
                        .then((value) => Navigator.pop(context, false));
                  },
                  hintText: 'Câmera',
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        );
      },
    ).then((exit) {
      if (exit == null) return;

      if (exit) {
        // user pressed Yes button
      } else {
        // user pressed No button
      }
    });
  }
}

class ImageLoading extends StatelessWidget {
  final double radius;
  final File? file;

  const ImageLoading({super.key, this.file, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: file != null,
      replacement: CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('lib/assets/images/user_icon.png'),
        backgroundColor: Colors.grey,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: getImage(),
        backgroundColor: Colors.grey,
      ),
    );
  }

  ImageProvider getImage() {
    if (file != null) {
      return FileImage(file!);
    }
    return const AssetImage('lib/assets/images/user_icon.png');
  }
}
