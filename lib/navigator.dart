
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
}
