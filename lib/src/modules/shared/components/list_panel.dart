import 'package:flutter/material.dart';

class ListPanel extends StatelessWidget {
  final String title;
  final bool moreOptionVisibility;
  final dynamic item;
  final VoidCallback? moreOptionOnTap;
  final VoidCallback? itemOnTap;

  const ListPanel({
    super.key,
    required this.title,
    this.moreOptionVisibility = false,
    this.item,
    this.moreOptionOnTap,
    this.itemOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Visibility(
                visible: moreOptionVisibility,
                child: GestureDetector(
                  child: const Text(
                    'Mais',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 95,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 200,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: item,
              );
            },
          ),
        ),
      ],
    );
  }
}
