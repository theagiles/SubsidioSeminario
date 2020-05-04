
import 'package:subsidios/Model/session.dart';
import 'package:subsidios/Model/usuario.dart';
import 'package:subsidios/Repository/repository.dart';
import 'package:subsidios/session_storage.dart';

class InicioSesionBloc {
  final Repository _repository = Repository();

  bool _access = false;
  Session session;
  final SessionStorage sessionStorage = SessionStorage();

  InicioSesionBloc();

  bool get access => _access;

  Future<bool> iniciarSesion(Usuario usuario) async {
    session = await _repository.inicioSesion(usuario);
    if (session.token != null) {
      await sessionStorage.saveSessionStorage(session);
      _access = true;
    }
      return _access;
  }
}