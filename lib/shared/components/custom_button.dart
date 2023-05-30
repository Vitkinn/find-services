import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String hintText;
  final String? hexColor;

  final Function()? onTap;

  Color getHexColor(hexColor) {
    if (hexColor == null || hexColor.isEmpty) {
      hexColor = '14cd84';
    }

    try {
      hexColor = int.parse('0xFF$hexColor');
      return Color(hexColor);
    } catch (e) {
      return const Color(0xFF14cd84);
    }
  }

  const CustomButton(
      {super.key, required this.onTap, required this.hintText, this.hexColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: getHexColor(hexColor),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(hintText,
                style: const TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }
}
