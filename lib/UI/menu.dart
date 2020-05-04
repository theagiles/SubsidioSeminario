
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:subsidios/UI/estudiantes/lista_estudiantes.dart';
import 'package:subsidios/UI/home.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  final ListaEstudiantePage _registro = ListaEstudiantePage();
  int _selectedIndex = 0;

  Widget _homepage = HomePage();

  Widget _pageChooser(int page){
    switch (page){
      case 0:
      return _homepage;
      break;
      case 1:
      return _registro;
      break;
      default:
      return Container(
        child:  Center(
          child: Text('ingrese.'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
            child: _homepage,
            ),
          ),
      bottomNavigationBar: GradientBottomNavigationBar(
        backgroundColorStart: Colors.purple,
        backgroundColorEnd: Colors.deepOrange,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.toc), title: Text('')),
        ],
        currentIndex: _selectedIndex,
        onTap: (int tappedIndex) {
            setState(() {
              _homepage = _pageChooser(tappedIndex);
            });
          },
        ),
      );
  }
}