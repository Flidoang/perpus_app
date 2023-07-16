// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perpustakaan/screen/Search/search.dart';
import 'package:perpustakaan/screen/home/home.dart';
import 'package:perpustakaan/screen/profile/profile.dart';

class bottomNav extends StatefulWidget {
  @override
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<bottomNav> {
  List pages = [
    homePage(),
    searchPage(),
    ProfilePage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color.fromARGB(255, 50, 64, 106),
        unselectedItemColor: Color.fromARGB(255, 106, 98, 101),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          // BottomNavigationBarItem(icon: Icon(Icons.info_outline_rounded), label: "About"),
        ],
      ),
    );
  }
}
