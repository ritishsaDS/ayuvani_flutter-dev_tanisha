import 'package:flutter/material.dart';

class PractoBottomNavigation extends StatefulWidget {
  @override
  _PractoBottomNavigationState createState() => _PractoBottomNavigationState();
}

class _PractoBottomNavigationState extends State<PractoBottomNavigation> {
  int currentIndex;

  getTheCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/pink home icon.png'),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/pink profile.png'),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/prescription icon.png'),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/pink chemist icon.png'),
          ),
          label: '',
        ),
      ],
      onTap: (value) {
        getTheCurrentIndex(value);
      },
    );
  }
}
