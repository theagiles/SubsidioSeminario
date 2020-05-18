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
          colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
          domainFn: (listGrafico, _) => listGrafico.fecha,
          measureFn: (listGrafico, _) => listGrafico.cantidad,
          id: 'Resultado',
          data: listGrafico)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Grafico")),
        body: Container(
            height: 450,
            padding: EdgeInsets.all(15),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Consulta de subsidios realizada por estudiante",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Expanded(
                      child: charts.BarChart(_generateData(),
                          animate: true,
                          vertical: true,
                          animationDuration: Duration(seconds: 5)),
                    )
                  ],
                ),
              ),
            )));
  }
}
