import 'package:flutter/material.dart';

abstract class ColorUtils {
  static Color getHexadecimalColor(hexColor) {
    if (hexColor == null || hexColor.isEmpty) {
      hexColor = '000000';
      //hexColor = '14cd84';
    }

    try {
      hexColor = int.parse('0xFF$hexColor');
      return Color(hexColor);
    } catch (e) {
      return const Color(0xFF000000);
    }
  }
}
