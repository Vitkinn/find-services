import 'package:flutter/material.dart';
import 'package:tcc_frontend/shared/components/custom_button.dart';

class RegisterPhotoPage extends StatefulWidget {
  dynamic data;

  RegisterPhotoPage(this.data, {super.key});

  @override
  State<RegisterPhotoPage> createState() => _RegisterPhotoPageState(data);
}

class _RegisterPhotoPageState extends State<RegisterPhotoPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final String _profilePictureUrl = 'lib/assets/images/UserIcon.png';

  String? _selectedOption;

  List<String> _options = [
    '---',
    'Masculino',
    'Feminino',
    'Prefiro não definir',
  ];

  final dynamic data;

  _RegisterPhotoPageState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 25),
                Image.asset(
                  'lib/assets/images/FindServices.png',
                  height: 100,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Por favor, selecione uma foto para o seu perfil e defina o seu sexo.',
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                ),
                const SizedBox(height: 25),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage(_profilePictureUrl),
                      backgroundColor: Colors.grey,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(75),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        color: Colors.white,
                        onPressed: () {
                          // Lógica para trocar a foto
                          // Implemente a lógica de seleção de imagem aqui
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: DropdownButtonFormField(
                      value: _selectedOption,
                      isExpanded: true,
                      decoration: InputDecoration(
                          label: Text(
                            'Sexo',
                            style: TextStyle(fontSize: 18),
                          ),
                          hintText: 'Selecione o seu sexo',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6))),
                      items: _options.map((String option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onTap: () => {},
                  hintText: 'Avançar',
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onTap: () => {},
                  hintText: 'Cancelar',
                  hexColor: '999999',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
