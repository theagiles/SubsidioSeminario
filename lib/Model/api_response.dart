
import 'package:subsidios/Model/estudiante.dart';

class ApiResponse {
  int statusResponse;
  String message;
  Object object;
  List<String> body;

  ApiResponse({this.statusResponse, this.object, this.message, this.body});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var bodyFromJson = json['body'];
    List<String> list =  List<String>.from(bodyFromJson);
    return ApiResponse(
        statusResponse: json['statusResponse'], object: json['object'], body: list);
  }

  Map<String, dynamic> toJson() =>
      {'statusResponse': statusResponse, 'object': object, 'body': body};
  
  List<Estudiante> listEstudiante = List();
}
