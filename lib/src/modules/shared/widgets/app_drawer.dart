import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/loged_user_entity.dart';
import 'package:tcc_frontend/src/modules/login/domain/entities/role_type.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/impl/auth_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authController = Modular.get<AuthController>();

    LogedUserEntity user = authController.getCurrentUser();

    return Drawer(
      width: MediaQuery.of(context).size.width * 70 / 100,
      child: Column(
        children: [
          GestureDetector(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('lib/assets/images/user_icon.png'),
              ),
              accountName: Text(user.username!),
              accountEmail: Text(user.login!),
            ),
            onTap: () => {
              Modular.to.navigate('/profile'),
            },
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: user.role != RoleType.serviceProvider,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Termos de Responsabilidade'),
                              content: const Text(
                                'Ao utilizar este aplicativo, você concorda com os termos de responsabilidade?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Fechar o diálogo
                                    Modular.to
                                        .navigate('/terms_responsability');
                                  },
                                  child: const Text('Ver termos'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Fechar o diálogo
                                  },
                                  child: const Text('Fechar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.work),
                        title: Text('Tornar-se um prestador de serviço!'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Modular.to.navigate('/logout'),
                    child: const ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Sair'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_off_rounded),
            title: Text('Inativar conta'),
          ),
        ],
      ),
    );
  }
}
