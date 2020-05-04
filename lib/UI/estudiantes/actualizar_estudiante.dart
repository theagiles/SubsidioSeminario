import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/estudiante_bloc.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/navigator.dart';
import 'package:subsidios/resource/constantes.dart';

class ActualizarEstudiantePage extends StatefulWidget {
  final Estudiante estudiante;
  const ActualizarEstudiantePage({Key key, this.estudiante}) : super(key: key);

  @override
  _ActualizarEstudiantePageState createState() => _ActualizarEstudiantePageState(estudiante: estudiante);
}

class _ActualizarEstudiantePageState extends State<ActualizarEstudiantePage>
    with SingleTickerProviderStateMixin {
    _ActualizarEstudiantePageState({this.estudiante});
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final EstudianteBloc estudianteBloc = EstudianteBloc();
  String selectedEstrato;
  Estudiante estudiante = Estudiante(
    nombre: '',
    apellido: '',
    identificacion: '',
    grado: 0,
    barrio: '',
    estrato: 0,
    email: '',
    password: ''
  );

  @override
  void initState() {
    super.initState();
    EstudianteBloc();
  }
  showUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text(Constants.actualizacion),
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
                onPressed: () {
                  SubNavigator.goToListaEstudiante(context);
                },
              )
            ],
          );
        });
  }
  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      estudianteBloc.createEstudiante(estudiante);
      showUpdateDialog(context);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.actualizar)),
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
                                labelText: Constants.labelNombre,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.person_outline)),
                            textCapitalization: TextCapitalization.sentences,
                            initialValue: estudiante.nombre,
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              estudiante.nombre = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelApellido,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.person_outline)),
                            textCapitalization: TextCapitalization.sentences,
                            initialValue: estudiante.apellido,
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              estudiante.apellido = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelGrado,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.event_available)),
                            maxLength: 2,
                            validator: validateNumeros,
                            initialValue: estudiante.grado.toString(),
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              estudiante.grado = int.parse(value);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelBarrio,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.location_on)),
                            textCapitalization: TextCapitalization.sentences,
                            initialValue: estudiante.barrio,
                            validator: validateName,
                            keyboardType: TextInputType.text,
                            onSaved: (String value) {
                              estudiante.barrio = value.trim();
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelUsuario,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.person)),
                                initialValue: estudiante.email,
                            validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String value) {
                              estudiante.email = value;
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("Estrato"),
                              value: estudiante.estrato.toString(),
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                color: Colors.deepPurple
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  estudiante.estrato=int.parse(newValue);
                                  print(estudiante.estrato=int.parse(newValue));
                                  estudiante.estrato=int.parse(newValue);
                                });
                              },
                              items: <String>["1"," 2", "3"," 4", "5", "6"]
                                .map<DropdownMenuItem<String>>((String svalue) {
                                  return DropdownMenuItem<String>(
                                    value: svalue,
                                    child: Text(svalue)
                                  );
                                })
                                .toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
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
  String validateEmail(String value) {
    String pattern = Constants.pattern;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return Constants.field_empty;
    } else if (!regExp.hasMatch(value)) {
      return Constants.estructura;
    } else {
      return null;
    }
  }
  String validateName(String value) {
    String pattern = Constants.patternNombre;
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return Constants.field_empty;
    } else if (!regExp.hasMatch(value)) {
      return Constants.nameStructure;
    }
    return null;
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
