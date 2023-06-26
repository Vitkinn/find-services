import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:tcc_frontend/src/modules/home/presentation/controllers/home_controller.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/app_drawer.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _homeController;
  final filterController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _homeController = Modular.get<HomeController>();
    _homeController.loadPage(Modular.args.data?['filter']);
    _homeController.loading.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

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
                const SizedBox(height: 20),
                CustomTextField(
                  controller: filterController,
                  hintText: 'Pesquise por um serviço, prestador, etc...',
                  obscureText: false,
                ),
                //
                // TO-DO Recents ListView
                //
                // const SizedBox(height: 30),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     children: [
                //       const Text(
                //         'Recentes',
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       const Spacer(),
                //       GestureDetector(
                //         child: const Text(
                //           'Mais',
                //           style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.blue,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 10),
                // SizedBox(
                //   height: 95,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 10,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Column(
                //         children: [
                //           Container(
                //             width: 75,
                //             height: 75,
                //             margin: const EdgeInsets.only(left: 20, bottom: 5),
                //             decoration: const BoxDecoration(
                //               shape: BoxShape.circle,
                //               image: DecorationImage(
                //                 image: NetworkImage(
                //                     'https://cdn-icons-png.flaticon.com/512/4436/4436481.png'),
                //                 fit: BoxFit.cover,
                //               ),
                //             ),
                //           ),
                //           Container(
                //             height: 15,
                //             margin: const EdgeInsets.only(left: 20),
                //             child: Text(
                //               'Recente $index',
                //               textAlign: TextAlign.center,
                //             ),
                //           ),
                //         ],
                //       );
                //     },
                //   ),
                // ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        'Prestadores',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _homeController.serviceProviders.length,
                    itemBuilder: (BuildContext context, int index) {
                      ServiceProviderModel serviceProvider =
                          _homeController.serviceProviders[index];
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Visibility(
                                visible: !_homeController.loading.value &&
                                    serviceProvider.user?.userPhotoUrl != null,
                                replacement: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage('lib/assets/images/user_icon.png'),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          _homeController.getPhotoUrl(serviceProvider)),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${serviceProvider.user!.name!} ${serviceProvider.user!.lastName}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('${serviceProvider.description}'),
                                  ],
                                ),
                              ),
                              const Icon(Icons.star_border),
                            ],
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
