import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/navigator.dart';

class ConsultaPage extends StatefulWidget {
  @override
  ConsultaPageState createState() => ConsultaPageState();
}

class ConsultaPageState extends State<ConsultaPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas'),
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
                                        leading: Icon(Icons.info),
                                        title: Text('Selecciona'),
                                        subtitle: Text(
                                            'Si desea saber cuantos estudiantes han consultado si son beneficiarios.'),
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
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                            ),
                                            const SizedBox(height: 12.0),
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
                                              child: Text('Consultar'),
                                              onPressed: () {SubNavigator.goToConsultaEstudiante(context);},
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                            ),
                                            Center(
                                              child: Card(
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                    const ListTile(
                                                      leading:
                                                          Icon(Icons.info),
                                                      title: Text('Selecciona'),
                                                      subtitle: Text(
                                                          'Si desea saber cuantos subsidios han sido registrados.'),
                                                    )
                                                  ])),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                            ),
                                            const SizedBox(height: 12.0),
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
                                              child: Text('Consultar'),
                                              onPressed: () {SubNavigator.goToReporteConsultaSubsidios(context);}
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ))))
            ],
          )),
    );
  }
}
