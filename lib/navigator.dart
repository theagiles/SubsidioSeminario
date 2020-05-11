
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

  static void goToGrafico(BuildContext context) {
    Navigator.pushNamed(context, Constants.graficoRoute);
  }

  static void goToRegistroSubsidio(BuildContext context) {
    Navigator.pushNamed(context, Constants.registroSubsidioRoute);
  }

  static void goToListaSubsidio(BuildContext context) {
    Navigator.pushNamed(context, Constants.listaSubsidioRoute);
  }

  static void goToEliminarSubsidio(BuildContext context) {
    Navigator.pushNamed(context, Constants.eliminarSubsidioRoute);
  }

  static void goToRegistroReporte(BuildContext context) {
    Navigator.pushNamed(context, Constants.registroReporteRoute);
  }

  static void goToListaReporte(BuildContext context) {
    Navigator.pushNamed(context, Constants.listaReporteRoute);
  }

  static void goToEliminarReporte(BuildContext context) {
    Navigator.pushNamed(context, Constants.eliminarReporteRoute);
  }
}
