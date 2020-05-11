import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/estudiante_bloc.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/navigator.dart';
import 'package:subsidios/resource/constantes.dart';

class EliminarEstudiantePage extends StatefulWidget {
  EliminarEstudiantePage({Key key}) : super(key: key);

  @override
  _EliminarEstudiantePageState createState() => _EliminarEstudiantePageState();
}

class _EliminarEstudiantePageState extends State<EliminarEstudiantePage> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final EstudianteBloc estudianteBloc = EstudianteBloc();
  Estudiante _estudiante = Estudiante(
    identificacion: ''
  );
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
                onPressed: () {SubNavigator.goToListaEstudiante(context);},
              )
            ],
          );
        });
  }
  void _handleSubmitted() {
    print("estudiante a eliminar + ${_estudiante.identificacion}");
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      estudianteBloc.deleteEstudiante(_estudiante);
      showDeleteDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.eliminarEstudiante),
        
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
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelDocumento,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.create)),
                                maxLength: 10,
                            validator: validateNumeros,
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              _estudiante.identificacion = value;
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
    String validateNumeros(String value) {
    String pattern = Constants.patterNumero;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return Constants.field_empty;
    } else if (!regExp.hasMatch(value)) {
      return Constants.estructura;
    }
    return null;
  }
}