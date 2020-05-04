
import 'package:subsidios/ApiService/estudiante_api_service.dart';
import 'package:subsidios/ApiService/usuario_api_service.dart';
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/Model/session.dart';
import 'package:subsidios/Model/usuario.dart';
import 'package:subsidios/session_storage.dart';

class Repository {

  final LoginApiService loginApiService = LoginApiService();
  final EstudianteApiService estudianteApiService = EstudianteApiService();
  final SessionStorage _session = SessionStorage();

  Future<Session> inicioSesion(Usuario usuario) => loginApiService.iniciarSesion(usuario);

  Future<String> getLocalAccessToken() => _session.getToken();
  //Estudiante
  Future<ApiResponse> registrarEstudiante(Estudiante estudiante, String token) => 
  estudianteApiService.insertEstudiante(estudiante, token);
  Future<ApiResponse> listaEstudiante(String token) => 
  estudianteApiService.listEstudiante(token);
  Future<ApiResponse> buscarEstudiante(Estudiante estudiante, String token) => 
  estudianteApiService.buscarEstudiante(estudiante, token);
}