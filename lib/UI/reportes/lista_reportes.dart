import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/reporte_bloc.dart';
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/reporte.dart';
import 'package:subsidios/UI/reportes/actualizar_reporte.dart';
import 'package:subsidios/navigator.dart';
import 'package:subsidios/resource/constantes.dart';

class ListaReportePage extends StatefulWidget {
  final Reporte reporte;
  const ListaReportePage({Key key, this.reporte}) : super(key: key);

  @override
  _ListaReportePageState createState() => _ListaReportePageState();
}

class _ListaReportePageState extends State<ListaReportePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Reporte reporte;
  final ReporteBloc reporteBloc = ReporteBloc();
  ApiResponse apiResponse;

  List<Reporte> listReporte = List();

  _handleSubmitted() {
    reporteBloc.listarReporte().then((apiResponse) {
      setState(() {
        listReporte = apiResponse.listReporte;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    ReporteBloc();
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.listareporte),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              SubNavigator.goToRegistroReporte(context);
            },
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                SubNavigator.goToEliminarReporte(context);
              })
        ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(15.0),
            itemCount: listReporte.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                color: Colors.blueGrey[indice],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text("Reporte: " + listReporte[indice].fecha,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(listReporte[indice].descripcion),
                      leading: Icon(Icons.attach_money),
                      onTap: () {
                        print(listReporte[indice].fecha);
                        reporte = listReporte[indice];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ActualizarReportePage(
                                      reporte: reporte)
                                    ));
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
