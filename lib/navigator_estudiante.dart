import 'package:flutter/cupertino.dart';
import 'package:subsidios/resource/constantes.dart';

class EstudNavigator {
  static void goToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Constants.homeRoute, (Route<dynamic> route) => false);
  }

  static void goToHomeEstudiante(BuildContext context) {
    Navigator.pushNamed(context, Constants.homeEstudianteRoute);
  }

  static void goToConsulta(BuildContext context) {
    Navigator.pushNamed(context, Constants.consultaDeEstudianteRoute);
  }
}