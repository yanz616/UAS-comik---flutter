import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile3/config/asset.dart';
import 'package:mobile3/view/menu.dart';
import 'package:mobile3/view/profil.dart';
import 'package:mobile3/view/register.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    Menu(),
    Profil()
    // Add more pages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        rippleColor: Colors.black,
        hoverColor: Colors.grey,
        haptic: true,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.black, width: 1),
        tabBorder: Border.all(color: Colors.grey, width: 1),
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 900),
        gap: 8,
        color: Colors.grey[800],
        activeColor: Asset.colorAccent,
        iconSize: 24,
        tabBackgroundColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.people,
            text: 'Profile',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
