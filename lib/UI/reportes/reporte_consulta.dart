import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/subsidio_bloc.dart';
import 'package:subsidios/Model/consulta.dart';
import 'package:subsidios/Model/respuesta_consulta.dart';
import 'package:subsidios/UI/reportes/grafico_consultas.dart';
import 'package:subsidios/resource/constantes.dart';

class ReporteConsultaPage extends StatefulWidget {
  @override
  ReporteConsultaPageState createState() => ReporteConsultaPageState();
}

class ReporteConsultaPageState extends State<ReporteConsultaPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SubsidioBloc subsidioBloc = SubsidioBloc();
  TextEditingController _inputDateInicial = TextEditingController();
  TextEditingController _inputDateFinal = TextEditingController();
  Consulta _consulta = Consulta(fechaInicial: '', fechaFinal: '');
  List<RestConsulta> listGrafico = List();
  Consulta consulta;
  @override
  void initState() {
    super.initState();
    _handleSubmitted();
  }

  _selectDateInicial(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2099),
    );
    if (picked != null) {
      setState(() {
        _consulta.fechaInicial = picked.toIso8601String() + "Z";
        _inputDateInicial.text = _consulta.fechaInicial;
      });
    }
  }

  _selectDateFinal(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2099),
    );
    if (picked != null) {
      setState(() {
        _consulta.fechaFinal = picked.toIso8601String() + "Z";
        _inputDateFinal.text = _consulta.fechaFinal;
      });
    }
  }

  void _handleSubmitted() {
    subsidioBloc.numeroConsultas(_consulta).then((apiResponse) {
      setState(() {
        listGrafico = apiResponse.listConsulta;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Consulta de estudiantes"),
      ),
      body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  child: SafeArea(
                      child: Container(
                          width: size.width,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                              ),
                              Center(
                                child: Card(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                      const ListTile(
                                        leading: Icon(Icons.message),
                                        title: Text('Selecciona'),
                                        subtitle: Text(
                                            'Un rango de fechas por el cual quieras realizar la consulta.'),
                                      )
                                    ])),
                              ),
                              Center(
                                child: SingleChildScrollView(
                                  child: SafeArea(
                                    top: false,
                                    bottom: false,
                                    child: Form(
                                      key: _formKey,
                                      autovalidate: _autovalidate,
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 40.0),
                                            ),
                                            const SizedBox(height: 12.0),
                                            TextField(
                                                enableInteractiveSelection:
                                                    false,
                                                controller: _inputDateInicial,
                                                decoration: InputDecoration(
                                                    hintText: "Fecha Inicial",
                                                    labelText: "Fecha Inicial",
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                    icon: Icon(
                                                        Icons.calendar_today)),
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());
                                                  _selectDateInicial(context);
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                            ),
                                            TextField(
                                                enableInteractiveSelection:
                                                    false,
                                                controller: _inputDateFinal,
                                                decoration: InputDecoration(
                                                    hintText: "Fecha Final",
                                                    labelText: "Fecha Final",
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                    icon: Icon(
                                                        Icons.calendar_today)),
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());
                                                  _selectDateFinal(context);
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                            ),
                                            MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0)),
                                              ),
                                              height: 50.0,
                                              minWidth: 150.0,
                                              color: Color(0xFFD32F2F),
                                              splashColor: Colors.red,
                                              textColor: Colors.white,
                                              child: Text(Constants.btnBuscar),
                                              onPressed: _handleSubmitted,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Card(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                      const ListTile(
                                        leading: Icon(Icons.list),
                                        title: Text(
                                            'Fechas de Consultas realizadas por estudiantes: '),
                                        subtitle: Text(''),
                                      ),
                                    ])),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child:
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                height: 40.0,
                                minWidth: 30.0,
                                color: Color(0xFF0097A7),
                                textColor: Colors.white,
                                child: Text('Mirar Gráfico'),
                                onPressed:() {Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              PSimpleBarChart(
                                                                listGrafico:
                                                                    listGrafico,
                                                              )));},
                              ),),
                              Center(
                                child: Container(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(20.0),
                                    itemCount: listGrafico.length,
                                    itemBuilder:
                                        (BuildContext context, int indice) {
                                      return Card(
                                          color: Colors.blueAccent[indice],
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ListTile(
                                                title: Text(
                                                    listGrafico[indice].fecha,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                subtitle: Text(
                                                    listGrafico[indice]
                                                        .cantidad
                                                        .toString()),
                                                leading: Icon(Icons.done_all),
                                                onTap: () {},
                                              )
                                            ],
                                          ));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ))))
            ],
          )),
    );
  }
}
