import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/usuario_bloc.dart';
import 'package:subsidios/navigator_estudiante.dart';
import 'package:subsidios/resource/constantes.dart';

class HomeEstudiantePage extends StatefulWidget {
  HomeEstudiantePage({Key key}) : super(key: key);

  @override
  _HomeEstudiantePageState createState() => _HomeEstudiantePageState();
}

class _HomeEstudiantePageState extends State<HomeEstudiantePage> {

final InicioSesionBloc inicioSesionBloc = InicioSesionBloc();

  TextStyle _style(){
    return TextStyle(
      fontWeight: FontWeight.bold
    );
  }
  void _handleSubmitted() async {
    await inicioSesionBloc.cerrarSesion();
    EstudNavigator.goToHome(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(Constants.appName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _handleSubmitted();
            },
          ),
        ]),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("", style: _style(),),
            SizedBox(height: 10,),
            Text(Constants.mensajeInicial),
            SizedBox(height: 30,),
            Center(
          child: Container(
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.light),
              child: SingleChildScrollView(
                  child: Form(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          const SizedBox(height: 12.0),
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
                            child: Text(Constants.btnConsultar),
                            onPressed: (){EstudNavigator.goToConsulta(context);}
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ),
          ),
        ),
            Divider(color: Colors.red,)
          ],
        ),
      ),
    );
  }

}