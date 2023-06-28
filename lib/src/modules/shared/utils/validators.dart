abstract class Validator {
  String? call(String? value);
}

class RequiredValidator extends Validator {
  @override
  String? call(String? value) {
    return value == null || value.trim().isEmpty ? 'O campo é obrigatório' : null;
  }
}

class NumberValidator extends Validator {
  @override
  String? call(String? value) {
    if (value != null && double.tryParse(value) == null) {
      return 'Por favor, insira um valor válido';
    }
    return null;
  }
}

class CEPValidator extends Validator {
  @override
  String? call(String? value) {
    if (value!.isEmpty) {
      return 'Por favor, informe um CEP';
    } else if (value.length > 8 || int.tryParse(value) == null) {
      return 'CEP inválido';
    }
      return null;
    }
}

class NumValidator extends Validator {
  @override
  String? call(String? value) {
    if (value!.isEmpty) {
      return 'Por favor, informe um número';
    } else if (value.length > 4 || int.tryParse(value) == null) {
        return 'Número inválido';
    }
    return null;
  }
}