import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/shared/utils/validators.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool requiredField;
  final String? errorText;
  final List<Validator> validators;
  final double? width;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int? minLines;

  const CustomTextField({
    super.key,
    this.requiredField = false,
    this.obscureText = false,
    this.validators = const [],
    this.errorText,
    this.minLines,
    this.width,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              final validators = getValidators();
              for (Validator validator in validators) {
                var validatorResult = validator.call(value!);
                if (validatorResult != null) {
                  return validatorResult;
                }
              }
              return null;
            },
            minLines: minLines,
            maxLines: minLines != null ? minLines! + 5 : null,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF14cd84))),
                fillColor: Colors.grey.shade200,
                errorText: errorText,
                suffixIcon: suffixIcon,
                filled: true,
                hintText: hintText)),
      ),
    );
  }

  List<Validator> getValidators() {
    List<Validator> defaultValidators = [];
    if (requiredField) {
      defaultValidators.add(RequiredValidator());
    }
    defaultValidators.addAll(validators);
    return defaultValidators;
  }
}
