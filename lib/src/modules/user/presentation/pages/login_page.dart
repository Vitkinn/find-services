import 'package:flutter/material.dart';
import '../../../../../components/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),

              //Logo
              Icon(
                Icons.circle,
                size: 100,
                color: Colors.green,
              ),
              Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 50),

              CustomTextField(),

              SizedBox(height: 20),

              CustomTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
