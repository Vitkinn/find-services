import 'package:flutter/material.dart';
import 'package:findservices/src/modules/shared/utils/color_utils.dart';

class ReturnButton extends StatelessWidget {
  final VoidCallback onTap;

  const ReturnButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: ColorUtils.getHexadecimalColor('14cd84'),
      ),
    );
  }
}
