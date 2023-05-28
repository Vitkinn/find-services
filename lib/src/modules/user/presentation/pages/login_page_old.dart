import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPageOld extends StatefulWidget {
  const LoginPageOld({super.key});

  @override
  State<LoginPageOld> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageOld> {
  /*late final ListUserController controller;

  late List<UserEntity> users = [];

  @override
  void initState() {
    super.initState();

    controller = Modular.get<ListUserController>();
    controller.users.addListener(() {
      setState(() {
        users = controller.users.value;
      });
    });
    controller.list();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*Image.asset(''),*/
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView(
                          children: [
                            const Padding(padding: EdgeInsets.all(10.0)),
                            CustomTextField(
                              label: 'Nome completo',
                              icon: Icons.person,
                              hint: 'Digite seu nome',
                              validators: [requiredValidator],
                              //onSave: (text) =>
                              //controller.change(fullname: text),
                            ),
                            SizedBox(
                              // width: double.infinity,
                              // height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  //onSubmit();
                                },
                                child: Text('Entrar'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Entrar',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? requiredValidator(text) {
    return text == null || text.isEmpty ? 'O campo é obrigatório' : null;
  }

  /*void onSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      controller.create();
    }
  }*/
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String? initialValue;
  final IconData? icon;
  final bool password;
  final List<TextInputFormatter> inputFormatters;
  final List<String? Function(String text)> validators;
  final void Function(String? text)? onChanged;
  final void Function(String? text)? onSave;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.initialValue,
    this.icon,
    this.password = false,
    this.inputFormatters = const [],
    this.validators = const [],
    this.onChanged,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: const OutlineInputBorder(),
            prefixIcon: icon == null ? null : Icon(icon),
          ),
          validator: (value) {
            for (var validator in validators) {
              var validatorResult = validator.call(value!);
              if (validatorResult != null) {
                return validatorResult;
              }
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: onSave,
          initialValue: initialValue,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          obscureText: password,
        ),
        const Padding(padding: EdgeInsets.all(10)),
      ],
    );
  }
}
