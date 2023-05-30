import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;

  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: Color(0xFF14cd84), borderRadius: BorderRadius.circular(10)),
        child: const Center(
            child: Text('Entrar',
                style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }
}
