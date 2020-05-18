
import 'package:subsidios/Model/consulta.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/Model/reporte.dart';
import 'package:subsidios/Model/respuesta_consulta.dart';
import 'package:subsidios/Model/subsidio.dart';

class ApiResponse {
  int statusResponse;
  String message;
  Object object;
  String mensaje;
  String body;

  ApiResponse({this.statusResponse, this.object, this.message, this.mensaje, this.body});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        statusResponse: json['statusResponse'], object: json['object'], mensaje: json['mensaje'], body: json['body']);
  }

  Map<String, dynamic> toJson() =>
      {'statusResponse': statusResponse, 'object': object, 'mensaje': mensaje, 'body': body};
  
  List<Estudiante> listEstudiante = List();
  List<Subsidio> listSubsidio = List();
  List<Reporte> listReporte = List();
  List<RestConsulta> listConsulta = List();
}
