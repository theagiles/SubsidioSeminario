import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/resource/constantes.dart';

class EstudianteApiService {
  Estudiante _estudiante;
  Future<ApiResponse> insertEstudiante(Estudiante estudiante, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    print("Token generado en api service "+ token);
    var body2 = json.encode(estudiante.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceInsertEstudiante);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: 'Bearer ' + token},
        body: body2);

    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);

    if (apiResponse.statusResponse == 200) {
      _estudiante = Estudiante.fromJson(resBody);
      apiResponse.object = _estudiante;
    }
    return apiResponse;
  }

  Future<ApiResponse> listEstudiante(String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceListEstudiante);
    var res = await http.get(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: 'Bearer ' + token
      },
    );
    final resBody = json.decode(res.body);
    print(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      resBody['body'].forEach((i) {
        apiResponse.listEstudiante.add(Estudiante.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }

  Future<ApiResponse> buscarEstudiante(Estudiante estudiante, String token) async {
    var queryParameters = {
      'documento': estudiante.identificacion.toString()
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServicefindEstudiante,
        queryParameters);
    var res = await http.get(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, 
        HttpHeaders.authorizationHeader: 'Bearer ' + token});
    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);
    print(resBody);

    if (apiResponse.statusResponse == 200) {
      _estudiante = Estudiante.fromJson(resBody);
      apiResponse.object = _estudiante;

    }
    return apiResponse;

  }
}