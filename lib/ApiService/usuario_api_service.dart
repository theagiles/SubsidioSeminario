import 'dart:convert';
import 'dart:io';
import 'package:subsidios/Model/session.dart';
import 'package:subsidios/Model/usuario.dart';
import 'package:subsidios/resource/constantes.dart';
import 'package:http/http.dart' as http;

class LoginApiService {
  LoginApiService();

  Session _session;
  Future<Session> iniciarSesion(Usuario usuario) async {
    var body2 = json.encode(usuario.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceLogin);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    print(res.body);
    print(resBody['body']);
    _session = Session.fromJson(resBody['body']);

    if (res.statusCode == 200) {
      print("Token " + _session.token);
      print("Rol " + _session.rol);
      return _session;
    }
    return _session;
  }
}
