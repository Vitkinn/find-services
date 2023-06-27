import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormServicePage extends StatefulWidget {
  @override
  _FormServicePage createState() => _FormServicePage();
}

class _FormServicePage extends State<FormServicePage> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Serviço'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Valor Ofertado',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um valor';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor, insira um valor válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _value = double.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Realizar ação com os dados do formulário, como enviar para o servidor
                        print('Descrição: $_description');
                        print('Valor Ofertado: $_value');
                      }
                    },
                    child: Text('Enviar'),
                  ),
                  SizedBox(width: 16.0),
                  TextButton(
                    onPressed: () {
                      Modular.to.navigate('/home');
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
