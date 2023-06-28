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
