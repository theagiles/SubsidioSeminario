import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/consulta.dart';
import 'package:subsidios/Model/respuesta_consulta.dart';
import 'package:subsidios/Model/subsidio.dart';
import 'package:subsidios/resource/constantes.dart';

class SubsidioApiService {
  Subsidio _subsidio;
  Future<ApiResponse> insertSubsidio(Subsidio subsidio, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    print("Token generado en api service " + token);
    var body2 = json.encode(subsidio.toJson());
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceInsertSubsidio);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: 'Bearer ' + token
        },
        body: body2);

    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);

    if (apiResponse.statusResponse == 200) {
      _subsidio = Subsidio.fromJson(resBody);
      apiResponse.object = _subsidio;
    }
    return apiResponse;
  }

  Future<ApiResponse> listSubsidio(String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceListSubsidio);
    var res = await http.get(
      uri,
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
        apiResponse.listSubsidio.add(Subsidio.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }

  Future<ApiResponse> deleteSubsidio(Subsidio subsidio, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var url = Constants.urlAu +
        Constants.pathServiceDeleteSubsidio +
        subsidio.estudiante;
    print(url);
    var res = await http.delete(url, headers: {
      HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
      HttpHeaders.authorizationHeader: 'Bearer ' + token
    });
    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);
    print(resBody);

    return apiResponse;
  }

  Future<ApiResponse> buscaSubsidio(Subsidio subsidio, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var url = Constants.urlAu +
        Constants.pathServiceBuscarSubsidio +
        subsidio.estudiante;
    print(url);
    var res = await http.get(url, headers: {
      HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
      HttpHeaders.authorizationHeader: 'Bearer ' + token
    });
    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);
    print(resBody);
    apiResponse.mensaje = resBody['mensaje'];
    print(apiResponse.mensaje);

    if (apiResponse.statusResponse == 200) {}
    return apiResponse;
  }

  Future<ApiResponse> numeroConsultas(Consulta consulta, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(consulta.toJson());
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceInsertSubsidio);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: 'Bearer ' + token
        },
        body: body2);

    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);
    print(resBody);

    if (apiResponse.statusResponse == 200) {
        resBody['body'].forEach((i) {
        apiResponse.listConsulta.add(RestConsulta.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }

  Future<ApiResponse> numeroSubsidios(Consulta consulta, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(consulta.toJson());
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceRegisterSubsidio);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: 'Bearer ' + token
        },
        body: body2);

    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);
    print(resBody);

    if (apiResponse.statusResponse == 200) {
        resBody['body'].forEach((i) {
        apiResponse.listConsulta.add(RestConsulta.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }
}
