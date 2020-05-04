
import 'package:flutter/material.dart';
import 'package:subsidios/resource/constantes.dart';

class SubNavigator {
  static void goToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Constants.homeRoute, (Route<dynamic> route) => false);
  }

  static void goToHomeAdmin(BuildContext context) {
    Navigator.pushNamed(context, Constants.menuRoute);
  }

  static void goToListaEstudiante(BuildContext context) {
    Navigator.pushNamed(context, Constants.listaEstudianteRoute);
  }

  static void goToRegistroEstudiante(BuildContext context) {
    Navigator.pushNamed(context, Constants.registroEstudianteRoute);
  }

  static void goToBuscarEstudiante(BuildContext context) {
    Navigator.pushNamed(context, Constants.buscarEstudianteRoute);
  }
}
