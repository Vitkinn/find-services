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
  bool isDoneSelected = true;
  Color? selectedDone = Colors.blueGrey;
  Color? selectedReceived;

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
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 30,
                          color: selectedDone,
                          child: const Center(
                            child: Text(
                              'Feitas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () => {selectOption(selectedDone)},
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 30,
                          color: selectedReceived,
                          child: const Center(
                            child: Text(
                              'Recebidas',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () => {selectOption(selectedReceived)},
                      ),
                    ],
                  ),
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
                  child: Visibility(
                    visible: isDoneSelected,
                    replacement: Column(children: [
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _serviceController.getServicesSize(),
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
                                                        .getServiceTitle(
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
                                                        .getServiceDate(
                                                            index) ??
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
                                                    .getServiceDescription(
                                                        index) ??
                                                '',
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            _serviceController
                                                    .getServiceRequester(
                                                        index) ??
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
                                              .getServiceTypeColor(index),
                                        ),
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
                    child: Column(children: [
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
                                                        .getRequestDate(
                                                            index) ??
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
                                                    .getRequestProvider(
                                                        index) ??
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FootBar(initialIndex: 1),
    );
  }

  void selectOption(Color? selectedOption) {
    if (selectedOption == selectedDone) {
      isDoneSelected = true;
      selectedDone = Colors.blueGrey;
      selectedReceived = null;
    } else {
      isDoneSelected = false;
      selectedDone = null;
      selectedReceived = Colors.blueGrey;
    }
    setState(() {});
  }
}
