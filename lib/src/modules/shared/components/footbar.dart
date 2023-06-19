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
    if (index != _currentIndex) {
      switch (index) {
        case 0:
          Modular.to.navigate('/home');
          break;
        case 1:
          Modular.to.navigate('/profile_edit');
          break;
        case 2:
          Modular.to.navigate('/profile');
          break;
        default:
          Modular.to.navigate('/home');
          break;
      }
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}
