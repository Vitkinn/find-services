import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  final String? title;
  final double? logoSize;

  const AppBanner({super.key, this.title, this.logoSize});

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
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      )
    ]);
  }
}
