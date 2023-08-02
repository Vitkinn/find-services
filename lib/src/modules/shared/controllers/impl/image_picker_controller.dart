import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:findservices/src/modules/shared/controllers/i_image_picker_controller.dart';
import 'package:findservices/src/modules/shared/widgets/custom_button.dart';

class ImagePickerController extends IImagePickerController {
  File? _image;

  Future<void> dialogBuilder(BuildContext context) {
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
                    pickImageFromGallery()
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
                    pickImageFromCamera()
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

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    _image = File(image.path);
  }

  Future pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return null;
    _image = File(image.path);
  }

  @override
  File? image() => _image;
}
