import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/entities/send_service_request_entity.dart';
import 'package:tcc_frontend/src/modules/service_requests/domain/usecases/request_service_usecase.dart';

class RequestServiceController {
  final IRequestServiceUsecase _requestServiceUsecase;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final MoneyMaskedTextController clientValueController = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    precision: 2,
    decimalSeparator: ',', // Separador decimal
    thousandSeparator: '.', // Separador de milhares
  );
  final ValueNotifier<bool> loading = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();

  late String serviceProviderId;

  RequestServiceController({required IRequestServiceUsecase requestServiceUsecase})
      : _requestServiceUsecase = requestServiceUsecase;

  void initPage() {
    serviceProviderId = Modular.args.data["serviceProviderId"];
  }

  void sendRequest() async {
    if (formIsValid()) {
      loading.value = true;
      var parsedValue = double.tryParse(clientValueController.text
              .replaceAll('R', '')
              .replaceAll('\$', '')
              .replaceAll(',', '')
              .replaceAll('.', '')) ??
          0;
      final request = await _requestServiceUsecase.call(SendServiceRequestEntity(
        serviceProviderId: serviceProviderId,
        clientWishValue: parsedValue / 100,
        serviceDescription: descriptionController.text,
        title: titleController.text,
      ));

      request.fold((l) {
        loading.value = false;
      }, (r) {
        loading.value = false;
        Modular.to.navigate('/services');
      });
    }
  }

  bool formIsValid() {
    return formKey.currentState!.validate();
  }

  void cancel() {
    Modular.to.navigate('/home');
  }
}
