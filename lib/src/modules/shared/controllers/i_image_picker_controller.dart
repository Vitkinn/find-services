import 'dart:io';

import 'package:flutter/material.dart';

abstract class IImagePickerController {
  Future<void> dialogBuilder(BuildContext context);
  File? image();
}
