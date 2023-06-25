import 'package:flutter/material.dart';

class ListPanel extends StatelessWidget {
  final String title;
  final bool moreOptionVisibility;
  final List? item;
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
              return Column(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    margin: const EdgeInsets.only(left: 20, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://images.twinkl.co.uk/tw1n/image/private/t_630/image_repo/2b/2b/T-T-17828-Editable-A4-Tools_ver_1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 15,
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Categoria $index',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
