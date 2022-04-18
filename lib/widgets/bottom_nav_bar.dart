import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  _onTap(newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  _applyColor(index) {
    return (_selectedIndex == index) ? kActiveIconColor : kTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/icons/calendar.svg',
                color: _applyColor(0),
              ),
            ),
            label: "Today"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/gym.svg',
                color: _applyColor(1),
              ),
            ),
            label: "All Exercises"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/icons/Settings.svg',
                color: _applyColor(2),
              ),
            ),
            label: "Settings")
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kActiveIconColor,
      onTap: (index) => _onTap(index),
    );
  }
}
