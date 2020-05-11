import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/reporte.dart';
import 'package:subsidios/resource/constantes.dart';

class ReporteApiService {
  Reporte _reporte;
  Future<ApiResponse> insertReporte(Reporte reporte, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    print("Token generado en api service " + token);
    var body2 = json.encode(reporte.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceInsertReporte);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: 'Bearer ' + token},
        body: body2);

    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);

    if (apiResponse.statusResponse == 200) {
      _reporte = Reporte.fromJson(resBody);
      apiResponse.object = _reporte;
    }
    return apiResponse;
  }

  Future<ApiResponse> listReporte(String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceListReporte);
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
        apiResponse.listReporte.add(Reporte.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }

  Future<ApiResponse> deleteReporte(Reporte reporte, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var url = Constants.urlAu + Constants.pathServiceDeleteReporte + reporte.subsidio.toString();
    print(url);
    var res = await http.delete(url,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, 
        HttpHeaders.authorizationHeader: 'Bearer ' + token});
    apiResponse.statusResponse = res.statusCode;
    var resBody = json.decode(res.body);
    print(resBody);

    return apiResponse;

  }
}