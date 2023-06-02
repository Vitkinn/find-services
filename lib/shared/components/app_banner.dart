import 'package:flutter/material.dart';
import 'package:tcc_frontend/shared/color_utils.dart';

class AppBanner extends StatelessWidget {
  final String? title;
  final double? titleSize;
  final double? logoSize;
  final String? titleHexColor;

  const AppBanner(
      {super.key,
      this.title,
      this.logoSize,
      this.titleSize,
      this.titleHexColor});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        'lib/assets/images/FindServices.png',
        height: logoSize ?? 100,
      ),
      const SizedBox(height: 10),
      Text(
        title ?? 'Title',
        style: TextStyle(
            fontSize: titleSize ?? 30,
            fontWeight: FontWeight.bold,
            color: ColorUtils.getHexadecimalColor(titleHexColor)),
      )
    ]);
  }
}
