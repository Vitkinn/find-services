import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool requiredField;

  const CustomTextField({
    super.key,
    this.requiredField = false,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
          validator: (value) {
            for (var validator in getValidators()) {
              var validatorResult = validator.call(value!);
              if (validatorResult != null) {
                return validatorResult;
              }
            }
            return null;
          },
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF14cd84))),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText)),
    );
  }

  List getValidators() {
    final validators = [];
    if (requiredField) {
      validators.add(requiredField);
    }
    return validators;
  }

  String? requiredValidator(text) {
    return text == null || text.isEmpty ? 'O campo é obrigatório' : null;
  }
}
