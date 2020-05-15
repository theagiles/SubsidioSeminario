import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/estudiante_bloc.dart';
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/UI/estudiantes/actualizar_estudiante.dart';
import 'package:subsidios/navigator.dart';
import 'package:subsidios/resource/constantes.dart';

class ListaEstudiantePage extends StatefulWidget {
  final Estudiante estudiante;
  const ListaEstudiantePage({Key key, this.estudiante}) : super(key: key);

  @override
  _ListaEstudiantePageState createState() => _ListaEstudiantePageState();
}

class _ListaEstudiantePageState extends State<ListaEstudiantePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Estudiante estudiante;
  final EstudianteBloc estudianteBloc = EstudianteBloc();
  ApiResponse apiResponse;

  List<Estudiante> listEstudiante = List();

  _handleSubmitted() {
    estudianteBloc.listarEstudiante().then((apiResponse) {
      setState(() {
        listEstudiante = apiResponse.listEstudiante;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    EstudianteBloc();
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => {SubNavigator.goToHomeAdmin(context)}
              );
            },
          ),
        title: const Text(Constants.listaEstudiantes),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              SubNavigator.goToRegistroEstudiante(context);
            },
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                SubNavigator.goToBuscarEstudiante(context);
              })
        ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(15.0),
            itemCount: listEstudiante.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                color: Colors.blueGrey[indice],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text("Estudiante: " + listEstudiante[indice].nombre,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(listEstudiante[indice].email),
                      leading: Icon(Icons.person),
                      onTap: () {
                        print(listEstudiante[indice].nombre);
                        estudiante = listEstudiante[indice];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ActualizarEstudiantePage(
                                      estudiante: estudiante,
                                    )));
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
