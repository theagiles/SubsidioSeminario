/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/resource/constantes.dart';

class GraficoPage extends StatefulWidget {
  @override
  GraficoPageState createState() => GraficoPageState();
}
class GraficoPageState extends State<GraficoPage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  bool _validate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void _handleSubmitted() async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      if(_validate){
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(Constants.grafico),
        ),
        body: Container(
            ));
  }
}*/

import 'dart:math';

/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatefulWidget {

  SimpleBarChart() : super();

  final String title = "Grafico";

  @override
  SimpleBarChartState createState() => SimpleBarChartState();
}

  class SimpleBarChartState extends State<SimpleBarChart>{
  
  List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData(){
    final random = Random();
    final desktopSalesData = [
      Sales('2015', random.nextInt(100)),
      Sales('2016', random.nextInt(100)),
      Sales('2017', random.nextInt(100)),
      Sales('2018', random.nextInt(100)),
      Sales('2019', random.nextInt(100)),
    ];

    return[
    charts.Series<Sales, String>(
      id: 'Sales',
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      data: desktopSalesData,

    )
    ];
  }
  
  barChart(){
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(35.0),
        child: barChart(),
      ),
    );
  }

}

class Sales{
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}
