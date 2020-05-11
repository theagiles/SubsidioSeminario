import 'package:flutter/material.dart';
import 'package:subsidios/UI/Estudiante/consulta_estudiante.dart';
import 'package:subsidios/UI/Estudiante/home_estudiante.dart';
import 'package:subsidios/UI/estudiantes/eliminar_estudiante.dart';
import 'package:subsidios/UI/estudiantes/lista_estudiantes.dart';
import 'package:subsidios/UI/estudiantes/registro_estudiantes.dart';
import 'package:subsidios/UI/menu.dart';
import 'package:subsidios/UI/login.dart';
import 'package:subsidios/UI/reportes/eliminar_reporte.dart';
import 'package:subsidios/UI/reportes/grafico.dart';
import 'package:subsidios/UI/reportes/lista_reportes.dart';
import 'package:subsidios/UI/reportes/registro_reporte.dart';
import 'package:subsidios/UI/subsidios/eliminar_subsidio.dart';
import 'package:subsidios/UI/subsidios/lista_subsidios.dart';
import 'package:subsidios/UI/subsidios/registro_subsidio.dart';
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
        Constants.buscarEstudianteRoute: (context) => EliminarEstudiantePage(),
        Constants.graficoRoute: (context) => SimpleBarChart(),
        Constants.registroSubsidioRoute: (context) => RegistroSubsidioPage(),
        Constants.listaSubsidioRoute: (context) => ListaSubsidioPage(),
        Constants.eliminarSubsidioRoute: (context) => EliminarSubsidioPage(),
        Constants.registroReporteRoute: (context) => RegistroReportePage(),
        Constants.listaReporteRoute: (context) => ListaReportePage(),
        Constants.eliminarReporteRoute: (context) => EliminarReportePage(),
        Constants.homeEstudianteRoute: (context) => HomeEstudiantePage(),
        Constants.consultaDeEstudianteRoute: (context) => ConsultaEstudiantePage()
      },
    );
  }
}
