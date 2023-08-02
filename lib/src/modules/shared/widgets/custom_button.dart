import 'package:flutter/material.dart';
import 'package:findservices/src/modules/shared/utils/color_utils.dart';

class CustomButton extends StatelessWidget {
  final String hintText;
  final String? color;
  final double padding;

  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.hintText,
    this.color,
    this.padding = 15,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: ColorUtils.getHexadecimalColor(color),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(hintText,
                style: const TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }
}
