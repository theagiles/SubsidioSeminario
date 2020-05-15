
import 'package:subsidios/ApiService/estudiante_api_service.dart';
import 'package:subsidios/ApiService/reporte_api_service.dart';
import 'package:subsidios/ApiService/subsidio_api_service.dart';
import 'package:subsidios/ApiService/usuario_api_service.dart';
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/consulta.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/Model/reporte.dart';
import 'package:subsidios/Model/session.dart';
import 'package:subsidios/Model/subsidio.dart';
import 'package:subsidios/Model/usuario.dart';
import 'package:subsidios/session_storage.dart';

class Repository {

  final LoginApiService loginApiService = LoginApiService();
  final EstudianteApiService estudianteApiService = EstudianteApiService();
  final SubsidioApiService subsidioApiService = SubsidioApiService();
  final ReporteApiService reporteApiService = ReporteApiService();
  final SessionStorage _session = SessionStorage();

  Future<Session> inicioSesion(Usuario usuario) => loginApiService.iniciarSesion(usuario);

  Future<String> getLocalAccessToken() => _session.getToken();
  Future<String> getLocalRol() => _session.getRol();
  Future deleteAll() => _session.deleteAllValues();
  //Estudiante
  Future<ApiResponse> registrarEstudiante(Estudiante estudiante, String token) => 
  estudianteApiService.insertEstudiante(estudiante, token);
  Future<ApiResponse> listaEstudiante(String token) => 
  estudianteApiService.listEstudiante(token);
  Future<ApiResponse> buscarEstudiante(Estudiante estudiante, String token) => 
  estudianteApiService.buscarEstudiante(estudiante, token);
    Future<ApiResponse> eliminarEstudiante(Estudiante estudiante, String token) => 
  estudianteApiService.deleteEstudiante(estudiante, token);
  //Subsidio
  Future<ApiResponse> registrarSubsidio(Subsidio subsidio, String token) => 
  subsidioApiService.insertSubsidio(subsidio, token);
  Future<ApiResponse> listaSubsidio(String token) => 
  subsidioApiService.listSubsidio(token);
    Future<ApiResponse> eliminarSubsidio(Subsidio subsidio, String token) => 
  subsidioApiService.deleteSubsidio(subsidio, token);
    Future<ApiResponse> buscarSubsidio(Subsidio subsidio, String token) => 
  subsidioApiService.buscaSubsidio(subsidio, token);
    Future<ApiResponse> numeroDeConsultas(Consulta consulta, String token) => 
  subsidioApiService.numeroConsultas(consulta, token);
  //Reporte
  Future<ApiResponse> registrarReporte(Reporte reporte, String token) => 
  reporteApiService.insertReporte(reporte, token);
  Future<ApiResponse> listaReporte(String token) => 
  reporteApiService.listReporte(token);
    Future<ApiResponse> eliminarReporte(Reporte reporte, String token) => 
  reporteApiService.deleteReporte(reporte, token);
}