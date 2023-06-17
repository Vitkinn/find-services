import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        'FindServices',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[100],
      snap: true,
      floating: true,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ), // Ícone de mensagens
        onPressed: () {
          // Ação ao pressionar o ícone de mensagens
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.message,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
