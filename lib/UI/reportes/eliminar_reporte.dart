import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/reporte_bloc.dart';
import 'package:subsidios/Bloc/subsidio_bloc.dart';
import 'package:subsidios/Model/reporte.dart';
import 'package:subsidios/Model/subsidio.dart';
import 'package:subsidios/navigator.dart';
import 'package:subsidios/resource/constantes.dart';

class EliminarReportePage extends StatefulWidget {
  EliminarReportePage({Key key}) : super(key: key);

  @override
  _EliminarReportePageState createState() => _EliminarReportePageState();
}

class _EliminarReportePageState extends State<EliminarReportePage> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final ReporteBloc reporteBloc = ReporteBloc();
  final SubsidioBloc subsidioBloc = SubsidioBloc();
  int selectSubsidio;
  List<Subsidio> listaSubsidio = List();
  Reporte _reporte = Reporte(
    subsidio: 0
  );

  @override
  void initState() {
    SubsidioBloc();
    subsidioBloc.listarSubsidio().then((apiResponse) {
      setState(() {
        listaSubsidio = apiResponse.listSubsidio;
      });
    });
    super.initState();
    ReporteBloc();
  }

  showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text(Constants.eliminado),
            actions: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Text(
                  Constants.btnCerrar,
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFFD32F2F),
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                onPressed: () {SubNavigator.goToListaReporte(context);},
              )
            ],
          );
        });
  }
  void _handleSubmitted() {
    print("Reporte a eliminar + ${_reporte.subsidio}");
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      reporteBloc.deleteReporte(_reporte);
      showDeleteDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.eliminarReporte),
        
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Center(
          child: Container(
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.light,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
                  )),
              isMaterialAppTheme: true,
              child: SingleChildScrollView(
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Form(
                    key: _formKey,
                    autovalidate: _autovalidate,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          const SizedBox(height: 12.0),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              hint: Text(Constants.labelSubsidio),
                              value: selectSubsidio,
                              isDense: true,
                              onChanged: (int newValue) {
                                selectSubsidio = newValue;
                                setState(() {
                                  selectSubsidio = newValue;
                                });
                                print(selectSubsidio);
                                _reporte.subsidio = newValue;
                              },
                              items: listaSubsidio.map((Subsidio map) {
                                return DropdownMenuItem<int>(
                                  value: map.numero,
                                  child: Text(map.numero.toString(),
                                      style: TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            height: 50.0,
                            minWidth: 150.0,
                            color: Color(0xFFD32F2F),
                            splashColor: Colors.red,
                            textColor: Colors.white,
                            child: Text(Constants.btnEliminar),
                            onPressed: _handleSubmitted
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}