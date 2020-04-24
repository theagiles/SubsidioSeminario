import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subsidios/Model/usuario.dart';
import 'package:subsidios/navigator.dart';
import 'package:subsidios/resource/constantes.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


Usuario _usuario = Usuario(
  correo: '',
  password: '',
);
  @override
  void initState() {
    super.initState();
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(Constants.appName),
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
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 90,
                                    margin:
                                        EdgeInsets.only(top: size.width * 0.2),
                                    height: 90,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                              Constants.loginImage2),
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 25)
                                        ]),
                                  ),
                                  SizedBox(height: 30)
                                ],
                              ),
                              Column(
                                children: <Widget>[
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40.0),
                                                ),
                                                const SizedBox(height: 12.0),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        Constants.labelUsuario,
                                                    icon: Icon(Icons.mail,
                                                        color: Colors.grey),
                                                    labelText:
                                                        Constants.labelUsuario,
                                                  border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20.0)
                                                  )),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  maxLength: 20,
                                                  onSaved: (String value) {
                                                    _usuario.correo = value;
                                                  },
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
                                                TextFormField(
                                                  obscureText: true,
                                                  autocorrect: false,
                                                  decoration: InputDecoration(
                                                      hintText: Constants
                                                          .labelPassword,
                                                      icon: Icon(Icons.lock,
                                                          color: Colors.grey),
                                                      labelText: Constants
                                                          .labelPassword,
                                                          border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(20.0)
                                                          )),
                                                  maxLength: 8,
                                                  onSaved: (String value) {
                                                    _usuario.password = value;
                                                  },
                                                  style:
                                                      TextStyle(fontSize: 18.0),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40.0),
                                                ),
                                                MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                    ),
                                                    height: 50.0,
                                                    minWidth: 150.0,
                                                    color: Color(0xFFD32F2F),
                                                    splashColor: Colors.red,
                                                    textColor: Colors.white,
                                                    child: Text(
                                                        Constants.btnIngresar),
                                                    onPressed:(){SubNavigator.goToHomeAdmin(context);}
                                                        
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))),
                )
              ],
            )));
  }
}
