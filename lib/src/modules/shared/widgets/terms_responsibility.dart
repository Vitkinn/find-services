import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TermsResponsibilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termos de Responsabilidade'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ao utilizar este aplicativo, você concorda que a empresa não se responsabiliza por quaisquer acidentes, danos, furtos ou perdas decorrentes do uso ou da participação em atividades relacionadas a este aplicativo. É de responsabilidade exclusiva do usuário tomar as devidas precauções e cuidados durante o uso do aplicativo.',
            ),
            const SizedBox(height: 10),
            const Text(
              'Este aplicativo é fornecido no estado em que se encontra, sem garantias de qualquer natureza, expressas ou implícitas. A empresa não se responsabiliza por quaisquer problemas técnicos, interrupções, falhas de conexão, vírus ou outras questões relacionadas ao uso do aplicativo.',
            ),
            const SizedBox(height: 10),
            const Text(
              'Ao utilizar este aplicativo, você concorda em isentar a empresa e seus representantes de qualquer responsabilidade por quaisquer danos ou prejuízos decorrentes do uso ou da impossibilidade de uso deste aplicativo.',
            ),
            const SizedBox(height: 10),
            const Text(
              'Ao aceitar este termo de responsabilidade, você reconhece ter lido e compreendido seus termos e concorda em utilizá-lo por sua própria conta e risco.',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Modular.to.navigate(
                      '/profile_edit',
                      arguments: {
                        "createServicePrivider": true,
                        "userId": null,
                      },
                    );
                  },
                  child: const Text('Confirmar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
