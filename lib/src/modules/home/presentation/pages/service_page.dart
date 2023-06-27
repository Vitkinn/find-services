import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';
import 'package:tcc_frontend/src/modules/home/presentation/controllers/service_controller.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/app_drawer.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late final ServiceController _serviceController;

  @override
  void initState() {
    super.initState();
    _serviceController = Modular.get<ServiceController>();
    _serviceController.loading.addListener(() {
      setState(() {});
    });
    _serviceController.loadPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('FindServices'),
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Lógica para o botão "Feitas"
                      },
                      child: Text(
                        'Feitas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 1,
                      color: Colors.black,
                    ),
                    TextButton(
                      onPressed: () {
                        // Lógica para o botão "Recebidas"
                      },
                      child: Text(
                        'Recebidas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Visibility(
                  visible: true,
                  replacement: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Não há serviços solicitados / recebidos',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          const Text(
                            'Solicitações recebidas',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _serviceController.getRequestsSize(),
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              _serviceController
                                                      .getRequestDescription(
                                                          index) ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Text(
                                              _serviceController
                                                      .getRequestDate(index) ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          _serviceController
                                                  .getRequestDescription(
                                                      index) ??
                                              '',
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          _serviceController
                                                  .getProvider(index) ??
                                              '',
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black26,
                                            width: 1.0,
                                          ),
                                          color: _serviceController
                                              .getRequestTypeColor(index)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FootBar(initialIndex: 1),
    );
  }
}
