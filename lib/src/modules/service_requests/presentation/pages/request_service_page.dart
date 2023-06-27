import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/service_requests/presentation/controllers/form_service_controller.dart';
import 'package:tcc_frontend/src/modules/shared/utils/validators.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';

class FormServicePage extends StatefulWidget {
  const FormServicePage({super.key});

  @override
  State<FormServicePage> createState() => _FormServicePage();
}

class _FormServicePage extends State<FormServicePage> {
  late final RequestServiceController _requestServiceController;

  @override
  void initState() {
    super.initState();
    _requestServiceController = Modular.get<RequestServiceController>()..initPage();
    _requestServiceController.loading.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Serviço'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _requestServiceController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: _requestServiceController.titleController,
                        hintText: 'Breve descrição',
                        keyboardType: TextInputType.text,
                        requiredField: true,
                        obscureText: false,
                      ),
                      SizedBox(height: 16.0),
                      CustomTextField(
                        controller: _requestServiceController.clientValueController,
                        hintText: 'Valor Ofertado',
                        requiredField: true,
                        keyboardType: TextInputType.number,
                        validators: [NumberValidator()],
                        obscureText: false,
                      ),
                      SizedBox(height: 16.0),
                      CustomTextField(
                        controller: _requestServiceController.descriptionController,
                        hintText: 'Detalhamento do serviço',
                        requiredField: true,
                        keyboardType: TextInputType.multiline,
                        minLines: 4,
                        obscureText: false,
                      ),
                      SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _requestServiceController.sendRequest();
                            },
                            child: Text('Enviar'),
                          ),
                          SizedBox(width: 16.0),
                          TextButton(
                            onPressed: () {
                              _requestServiceController.cancel();
                            },
                            child: Text('Cancelar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_requestServiceController.loading.value)
            const Opacity(
              opacity: 0.8,
              child: ModalBarrier(dismissible: false, color: Colors.black),
            ),
          if (_requestServiceController.loading.value)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
