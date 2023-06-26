import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/app_drawer.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';
import '../../../profile/domain/entities/profile_evaluation_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final filterController = TextEditingController();
  List<bool> isStarredList = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('FindServices'),
        actions: [GestureDetector(child: Icon(Icons.chat))],
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                  controller: filterController,
                  hintText: 'Pesquise por um serviço, prestador, etc...',
                  obscureText: false,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Text(
                        'Prestadores',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        child: const Icon(Icons.filter_list_alt),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: const Text(
                          'Mais',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToProfile('5218459d-2cdb-48bb-8b0c-5426078eeb04');
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://cdn-icons-png.flaticon.com/512/4436/4436481.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Prestador $index',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Informações sobre o prestador deverão constar aqui.',
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isStarredList[index] = !isStarredList[index];
                                    });
                                  },
                                  child: Icon(
                                    isStarredList[index] ? Icons.star : Icons.star_border,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FootBar(),
    );
  }
}

void navigateToProfile(String id) {
  Modular.to.navigate('/profile', arguments: {"profilerId": id});
}
