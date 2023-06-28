import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/home/presentation/controllers/home_controller.dart';
import 'package:tcc_frontend/src/modules/home/presentation/controllers/view_request_controller.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';
import 'package:tcc_frontend/src/modules/shared/utils/validators.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/app_drawer.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/return_button.dart';

class ViewRequestPage extends StatefulWidget {
  const ViewRequestPage({Key? key}) : super(key: key);

  @override
  State<ViewRequestPage> createState() => _ViewRequestPageState();
}

class _ViewRequestPageState extends State<ViewRequestPage> {
  late final ViewRequestController _controller;
  List<bool> isStarredList = List.filled(10, false);

  @override
  void initState() {
    super.initState();

    _controller = Modular.get<ViewRequestController>();
    _controller.loadPage();
    _controller.loading.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            title: const Text('FindServices'),
            elevation: 0,
          ),
          drawer: const AppDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: ReturnButton(onTap: () {
                      _controller.goBack();
                    }),
                  ),
                ),
                Column(children: [
                  Form(
                    key: _controller.formKey,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            _controller.getTitle(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: _controller.getStatusColor(),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _controller.getStatus(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _controller.getFormatedDate(),
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          CustomTextField(
                            controller: _controller.clientValueController,
                            hintText: 'Valor Ofertado',
                            requiredField: true,
                            enabled: false,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                          ),
                          SizedBox(height: 16.0),
                          CustomTextField(
                            controller: _controller.descriptionController,
                            hintText: 'Detalhamento do serviço',
                            requiredField: true,
                            enabled: false,
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            obscureText: false,
                          ),
                          SizedBox(height: 16.0),
                          CustomTextField(
                            controller: _controller.valueController,
                            hintText: 'Valor Ofertado',
                            requiredField: true,
                            enabled: _controller.isMyServices && !_controller.isBlocked(),
                            keyboardType: TextInputType.number,
                            obscureText: false,
                          ),
                          SizedBox(height: 16.0),
                          CustomTextField(
                            controller: _controller.valueJustificationController,
                            hintText: 'Detalhamento do serviço',
                            requiredField: true,
                            enabled: _controller.isMyServices && !_controller.isBlocked(),
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            obscureText: false,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: _controller.isMyServices &&
                                    !_controller.isApproved() &&
                                    !_controller.isBlocked(),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 7),
                                    ElevatedButton(
                                      onPressed: () {
                                        _controller.rejectService();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return Colors.red;
                                        }),
                                      ),
                                      child: Text('Recusar'),
                                    ),
                                    const SizedBox(width: 7),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: _controller.isMyServices &&
                                    !_controller.isApproved() &&
                                    !_controller.isBlocked(),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 7),
                                    ElevatedButton(
                                      onPressed: () {
                                        _controller.evaluate();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return Colors.green;
                                        }),
                                      ),
                                      child: Text('Enviar'),
                                    ),
                                    const SizedBox(width: 7),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: !_controller.isMyServices &&
                                    !(_controller.isApproved() || _controller.isDone()),
                                child: Row(
                                  children: [
                                    SizedBox(width: 7),
                                    ElevatedButton(
                                      onPressed: () {
                                        _controller.cancel();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return Colors.grey;
                                        }),
                                      ),
                                      child: Text('Cancelar'),
                                    ),
                                    SizedBox(width: 7),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: !_controller.isMyServices &&
                                    _controller.isPendingClientAccept(),
                                child: Row(
                                  children: [
                                    SizedBox(width: 7),
                                    ElevatedButton(
                                      onPressed: () {
                                        _controller.accept();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return Colors.green;
                                        }),
                                      ),
                                      child: Text('Aceitar'),
                                    ),
                                    const SizedBox(width: 7),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: _controller.isMyServices && _controller.isApproved(),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 7),
                                    ElevatedButton(
                                      onPressed: () {
                                        _controller.finish();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return Colors.green;
                                        }),
                                      ),
                                      child: Text('Finalizar'),
                                    ),
                                    const SizedBox(width: 7),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          bottomNavigationBar: const FootBar(initialIndex: 1),
        ),
        if (_controller.loading.value)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_controller.loading.value)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
