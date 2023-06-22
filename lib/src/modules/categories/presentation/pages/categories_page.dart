import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Minha Tela',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Ação do ícone superior esquerdo (menu, por exemplo)
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.chat, color: Colors.black),
              onPressed: () {
                // Ação do ícone de chat/mensagem
              },
            ),
          ],
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisa',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Categorias',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              childAspectRatio: 3.0,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: categorias.map((categoria) {
                return GestureDetector(
                  onTap: () {
                    // Ação ao clicar na categoria
                    print('Categoria selecionada: $categoria');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
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
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.report, color: Colors.black),
                  onPressed: () {
                    // Ação do ícone de relatório
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    // Ação do ícone da casinha
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chat, color: Colors.black),
                  onPressed: () {
                    // Ação do ícone de chat/mensagem
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
