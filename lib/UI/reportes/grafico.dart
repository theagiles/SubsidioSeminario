import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:subsidios/Model/respuesta_consulta.dart';

class PSimpleBarChart extends StatefulWidget {
  List<RestConsulta> listGrafico = List();

  PSimpleBarChart({this.listGrafico}) : super();

  @override
  PSimpleBarChartState createState() =>
      PSimpleBarChartState(listGrafico: listGrafico);
}

class PSimpleBarChartState extends State<PSimpleBarChart> {
  PSimpleBarChartState({this.listGrafico});
  
    List<RestConsulta> listGrafico;
  List<charts.Series<RestConsulta, String>> _generateData() {
    
    return [
      charts.Series(
        domainFn: (listGrafico, _) => listGrafico.fecha,
        measureFn: (listGrafico, _) => listGrafico.cantidad,
        id: 'Resultado',
        data: listGrafico,
        //labelAccessorFn: (RestConsulta row, _) => "${row.fecha}",
      )];}
    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Grafico")),
      body: Container(
        padding: EdgeInsets.all(35.0),
        child: charts.BarChart(_generateData(), animate: false),
      ),
    );
  }
}
