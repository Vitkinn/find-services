import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:findservices/src/app_module.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FindServices',
      theme: ThemeData(primarySwatch: Colors.green),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
