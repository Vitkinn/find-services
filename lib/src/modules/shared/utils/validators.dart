abstract class Validator {
  String? call(String? value);
}

class RequiredValidator extends Validator {
  @override
  String? call(String? value) {
    return value == null || value.isEmpty ? 'O campo é obrigatório' : null;
  }
}
