import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Bloc/subsidio_bloc.dart';
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/subsidio.dart';
import 'package:subsidios/UI/subsidios/actualizar_subsidio.dart';
import 'package:subsidios/navigator.dart';
import 'package:subsidios/resource/constantes.dart';


class ListaSubsidioPage extends StatefulWidget {
  final Subsidio subsidio;
  const ListaSubsidioPage({Key key, this.subsidio}) : super(key: key);

  @override
  _ListaSubsidioPageState createState() => _ListaSubsidioPageState();
}

class _ListaSubsidioPageState extends State<ListaSubsidioPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Subsidio subsidio;
  final SubsidioBloc subsidioBloc = SubsidioBloc();
  ApiResponse apiResponse;

  List<Subsidio> listSubsidio = List();

  _handleSubmitted() {
    subsidioBloc.listarSubsidio().then((apiResponse) {
      setState(() {
        listSubsidio = apiResponse.listSubsidio;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    SubsidioBloc();
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.listaSubsidio),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              SubNavigator.goToRegistroSubsidio(context);
            },
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                SubNavigator.goToEliminarSubsidio(context);
              })
        ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(15.0),
            itemCount: listSubsidio.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                color: Colors.blueGrey[indice],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text("Subsidio: " + listSubsidio[indice].valor.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(listSubsidio[indice].numero.toString()),
                      leading: Icon(Icons.attach_money),
                      onTap: () {
                        print(listSubsidio[indice].numero);
                        subsidio = listSubsidio[indice];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ActualizarSubsidioPage(
                                      subsidio: subsidio)
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
