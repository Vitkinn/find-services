import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FootBar extends StatefulWidget {
  final int initialIndex;

  const FootBar({super.key, this.initialIndex = 0});

  @override
  State<FootBar> createState() => _FootBarState(currentindex: initialIndex);
}

class _FootBarState extends State<FootBar> {
  int _currentIndex = 0;

  _FootBarState({required int currentindex}) : _currentIndex = currentindex;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (_currentIndex) {
      case 0:
        Modular.to.navigate('/categories');
        break;
      case 1:
        Modular.to.navigate('/services');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Serviços',
        ),
      ],
    );
  }
}
