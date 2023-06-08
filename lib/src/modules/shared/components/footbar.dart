import 'package:flutter/material.dart';

class FootBar extends StatelessWidget {
  final int _currentIndex = 0;

  const FootBar({super.key});

  /*void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      //onTap: _onTabTapped,
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
