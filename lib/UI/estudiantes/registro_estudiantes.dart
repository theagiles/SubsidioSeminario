import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Model/estrato.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/resource/constantes.dart';

class RegistrostudiantePage extends StatefulWidget {
  RegistrostudiantePage({Key key}) : super(key: key);

  @override
  _RegistrostudiantePageState createState() => _RegistrostudiantePageState();
}

class _RegistrostudiantePageState extends State<RegistrostudiantePage> {
  bool _autovalidate = false;

  Estudiante _estudiante = Estudiante(
    nombre: '',
    apellido: '',
    identificacion: '',
    grado: '',
    barrio: '',
    usuario: '',
    password: '',
    estrato: Estrato(idEstrato: 0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.registro),
        
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
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: Constants.labelNombre,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.person_outline)),
                            //validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _estudiante.nombre = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: Constants.labelApellido,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.person_outline)),
                            //validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _estudiante.apellido = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: Constants.labelDocumento,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.create)),
                            //validator: validatePago,
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              _estudiante.identificacion = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: Constants.labelGrado,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.event_available)),
                            //validator: validateName,
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              _estudiante.grado = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: Constants.labelBarrio,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.location_on)),
                            //validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _estudiante.barrio = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: Constants.labelUsuario,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.person)),
                            //validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _estudiante.usuario = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: Constants.labelPassword,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.lock)),
                            //validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              _estudiante.password = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: new InputDecoration(
                                labelText: Constants.labelEstrato,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.location_searching)),
                            //validator: validateName,
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              _estudiante.estrato.idEstrato = int.parse(value);
                            },
                            style: TextStyle(fontSize: 18.0),
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
                            child: Text(Constants.btnRegistrar),
                            onPressed: () {},
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
