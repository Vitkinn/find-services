import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tcc_frontend/src/modules/home/domain/entities/evaluate_service_entity.dart';
import 'package:tcc_frontend/src/modules/home/domain/entities/service_entity.dart';
import 'package:tcc_frontend/src/modules/home/domain/usecases/evaluate_service_usecase.dart';
import 'package:tcc_frontend/src/modules/home/domain/usecases/reject_service_usecase.dart';

class ViewRequestController {
  final IEvaluateServiceUsecase _evaluateServiceUsecase;
  final IRejectServiceUsecase _rejectServiceUsecase;

  final MoneyMaskedTextController clientValueController = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    precision: 2,
    decimalSeparator: ',',
    thousandSeparator: '.',
  );
  final TextEditingController descriptionController = TextEditingController();
  final MoneyMaskedTextController valueController = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    precision: 2,
    decimalSeparator: ',',
    thousandSeparator: '.',
  );
  final TextEditingController valueJustificationController = TextEditingController();

  final ValueNotifier<bool> loading = ValueNotifier(true);
  late ServiceEntity serviceEntity;
  late bool isMyRequests;
  final formKey = GlobalKey<FormState>();

  ViewRequestController({
    required IEvaluateServiceUsecase evaluateServiceUsecase,
    required IRejectServiceUsecase rejectServiceUsecase,
  })  : _evaluateServiceUsecase = evaluateServiceUsecase,
        _rejectServiceUsecase = rejectServiceUsecase;

  void loadPage() {
    serviceEntity = Modular.args.data["serviceRequest"] as ServiceEntity;
    isMyRequests = Modular.args.data["isMyRequests"] as bool;
    clientValueController.text = serviceEntity.clientWishValue.toString();
    descriptionController.text = serviceEntity.description!;
    loading.value = false;
  }

  void evaluate() async {
    if (isValid()) {
      var parsedValue = double.tryParse(valueController.text
          .replaceAll('R', '')
          .replaceAll('\$', '')
          .replaceAll(',', '')
          .replaceAll('.', ''));

      final result = await _evaluateServiceUsecase.call(
          serviceEntity.id!,
          EvaluateServiceEntity(
            value: (parsedValue! / 100),
            valueJustification: valueJustificationController.text,
          ));
      result.fold((l) {
        loading.value = false;
      }, (r) {
        loading.value = false;
        Modular.to.navigate('/services');
      });
    }
  }

  void rejectService() async {
    loading.value = true;
    final request = await _rejectServiceUsecase.call(serviceEntity.id!);
    request.fold((l) {
      loading.value = false;
    }, (r) {
      loading.value = false;
      Modular.to.navigate('/services');
    });
  }

  void goBack() {
    Modular.to.navigate('/services');
  }

  bool isValid() {
    return formKey.currentState!.validate();
  }

  String getTitle() {
    return serviceEntity.title ?? '';
  }

  String getFormatedDate() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return serviceEntity.createDate != null ? formatter.format(serviceEntity.createDate!) : '';
  }

  String getStatus() {
    switch (serviceEntity.requestStatus) {
      case 'PENDING_SERVICE_ACCEPT':
        return 'Aguardando orçamento';
      case 'PENDING_CLIENT_APPROVED':
        return 'Aguardando aceite';
      case 'APPROVED':
        return 'Aprovado';
      case 'CANCELED':
        return 'Cancelado';
      case 'SERVICE_REJECTED':
        return 'Rejeitado';
      case 'DONE':
        return 'finalizado';
      default:
        return '';
    }
  }

  Color getStatusColor() {
    switch (serviceEntity.requestStatus) {
      case 'PENDING_SERVICE_ACCEPT':
        return Colors.yellow;
      case 'PENDING_CLIENT_APPROVED':
        return Colors.blue;
      case 'APPROVED':
        return Colors.green;
      case 'CANCELED':
        return Colors.grey;
      case 'SERVICE_REJECTED':
        return Colors.red;
      case 'DONE':
        return Colors.lightGreen;
      default:
        return Colors.white;
    }
  }
}
