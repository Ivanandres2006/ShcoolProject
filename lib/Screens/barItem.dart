import 'package:colegio_app/Screens/Home.dart';
import 'package:colegio_app/Screens/News_Screens/newsScreens.dart';
import 'package:colegio_app/Screens/Notes_Screens/notes.dart';
import 'package:colegio_app/Screens/Photos_Screens/photosScreens.dart';
import 'package:colegio_app/Screens/To-list_Screens/to_do_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BarItemScreen extends StatefulWidget {
  const BarItemScreen({super.key});

  @override
  State<BarItemScreen> createState() => _BarItemScreenState();
}

class _BarItemScreenState extends State<BarItemScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  final Screens = [
    home_screen(),
    notesScreen(),
    newsPage(),
    photosPage(),
    to_doScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_sharp),
            label: 'Notas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Fotos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
              size: 27,
            ),
            label: 'To-do List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
