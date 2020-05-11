import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/estudiante_bloc.dart';
import 'package:subsidios/Bloc/subsidio_bloc.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/Model/subsidio.dart';
import 'package:subsidios/navigator.dart';
import 'package:subsidios/resource/constantes.dart';

class ActualizarSubsidioPage extends StatefulWidget {
  final Subsidio subsidio;
  ActualizarSubsidioPage({this.subsidio, key}) : super(key: key);

  @override
  _ActualizarSubsidioPageState createState() => _ActualizarSubsidioPageState(subsidio:subsidio);
}

class _ActualizarSubsidioPageState extends State<ActualizarSubsidioPage> {
  _ActualizarSubsidioPageState({this.subsidio});
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _inputDate = TextEditingController();
  bool _autovalidate = false;
  final EstudianteBloc estudianteBloc = EstudianteBloc();
  final SubsidioBloc subsidioBloc = SubsidioBloc();
  List<Estudiante> listaEstudiante = List();
  String selectedEstudiante;
  Subsidio subsidio = Subsidio(
    fecha: '',
    numero: 0,
    valor: 0,
    estudiante:''
  ); 

  @override
  void initState() {
    EstudianteBloc();
    estudianteBloc.listarEstudiante().then((apiResponse) {
      setState(() {
        listaEstudiante = apiResponse.listEstudiante;
      });
    });
    super.initState();
    SubsidioBloc();
  }

  showRegisterDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text(Constants.registroExitoso),
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
                onPressed: () {SubNavigator.goToListaSubsidio(context);},
              )
            ],
          );
        });
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2099),
    );
    if (picked != null) {
      setState(() {
        subsidio.fecha = picked.toIso8601String() + "Z";
        _inputDate.text = subsidio.fecha;
      });
    }
  }
  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
    } else {
      form.save();
      subsidioBloc.createSubsidio(subsidio);
      showRegisterDialog(context);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.registro,)
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Center(
          child: Container(
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.light,
                  hintColor: Colors.red,
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
                          TextField(
                              enableInteractiveSelection: false,
                              controller: _inputDate,
                              decoration: InputDecoration(
                                  hintText: "Fecha",
                                  labelText: "Fecha",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  suffix: Icon(Icons.create),
                                  icon: Icon(Icons.calendar_today)),
                                  
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                _selectDate(context);
                              }),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelENumeroSubsidio,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.person_outline)),
                            textCapitalization: TextCapitalization.sentences,
                            initialValue: subsidio.numero.toString(),
                            validator: validateNumeros,
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              subsidio.numero = int.parse(value);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: Constants.labelValor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                icon: Icon(Icons.create)),
                                initialValue: subsidio.valor.toString(),
                                maxLength: 10,
                            validator: validateNumeros,
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              subsidio.valor = int.parse(value);
                            },
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("Seleccionar"),
                              value: subsidio.estudiante,
                              isDense: true,
                              onChanged: (String newValue) {
                                subsidio.estudiante = newValue;
                                setState(() {
                                  subsidio.estudiante = newValue;
                                });
                                print(subsidio.estudiante);
                                subsidio.estudiante = newValue;
                              },
                              items: listaEstudiante.map((Estudiante map) {
                                return DropdownMenuItem<String>(
                                  value: map.identificacion,
                                  child: Text(map.nombre,
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
