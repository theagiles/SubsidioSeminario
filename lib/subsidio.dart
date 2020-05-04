import 'package:flutter/material.dart';
import 'package:subsidios/UI/estudiantes/buscar_estudiante.dart';
import 'package:subsidios/UI/estudiantes/lista_estudiantes.dart';
import 'package:subsidios/UI/estudiantes/registro_estudiantes.dart';
import 'package:subsidios/UI/menu.dart';
import 'package:subsidios/UI/login.dart';
import 'package:subsidios/resource/constantes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        primaryColor: Color(0xFFD32F2F),
      ),
      initialRoute: Constants.homeRoute,
      routes: {
        Constants.homeRoute: (context) => LoginPage(),
        Constants.menuRoute: (context) => MenuPage(),
        Constants.registroEstudianteRoute: (context) => RegistrostudiantePage(),
        Constants.listaEstudianteRoute: (context) => ListaEstudiantePage(),
        Constants.buscarEstudianteRoute: (context) => BuscarEstudiantePage(),
      },
    );
  }
}
