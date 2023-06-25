import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categorias = [
    'Limpeza residencial',
    'Limpeza de carpetes e estofados',
    'Limpeza pós-obra',
    'Limpeza de janelas',
    'Passar roupas',
    'Lavagem de roupas',
    'Cozinhar/refeições caseiras',
    'Babá ou cuidador de crianças',
    'Cuidador de idosos',
    'Passeador de cães',
    'Limpeza residencial',
    'Limpeza de carpetes e estofados',
    'Limpeza pós-obra',
    'Limpeza de janelas',
    'Passar roupas',
    'Lavagem de roupas',
    'Cozinhar/refeições caseiras',
    'Babá ou cuidador de crianças',
    'Cuidador de idosos',
    'Passeador de cães',
  ];

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('FindServices'),
        actions: [
          GestureDetector(child: const Icon(Icons.chat)),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                  child: Text(
                    'Categorias',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16.0),
                    childAspectRatio: 3.0,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    physics: const BouncingScrollPhysics(),
                    children: categorias.map((categoria) {
                      return GestureDetector(
                        onTap: () {
                          print('Categoria selecionada: $categoria');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/banner.jpg'),
                                fit: BoxFit.cover,
                              )),
                          child: Center(
                            child: Text(
                              categoria,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FootBar(initialIndex: 1),
    );
  }
}
