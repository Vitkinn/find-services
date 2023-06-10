import 'package:flutter/material.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Center(child: Text('To do')),
        ),
      ),
      bottomNavigationBar: const FootBar(),
    );
  }
}
