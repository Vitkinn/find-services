import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_button.dart';

class SaveCancelButtons extends StatelessWidget {
  static const String primaryColorHexadecimal = '14cd84';
  static const String secondColorHexadecimal = '999999';
  final String saveText;
  final String cancelText;
  final VoidCallback onSaveTap;
  final VoidCallback onCancelTap;

  const SaveCancelButtons({
    super.key,
    this.saveText = 'Salvar',
    this.cancelText = 'Cancelar',
    required this.onSaveTap,
    required this.onCancelTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          hintText: saveText,
          color: primaryColorHexadecimal,
          onTap: onSaveTap,
        ),
        const SizedBox(height: 10),
        CustomButton(
          hintText: cancelText,
          color: secondColorHexadecimal,
          onTap: onCancelTap,
        ),
      ],
    );
  }
}
