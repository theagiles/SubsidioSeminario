import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/resource/constantes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextStyle _style(){
    return TextStyle(
      fontWeight: FontWeight.bold
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(Constants.appName),
        ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("", style: _style(),),
            SizedBox(height: 10,),
            Text(Constants.mensajeInicial),
            SizedBox(height: 30,),
            
            Divider(color: Colors.red,)
          ],
        ),
      ),
    );
  }

}