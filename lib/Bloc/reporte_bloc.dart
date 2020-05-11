import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/reporte.dart';
import 'package:subsidios/Repository/repository.dart';
import 'package:subsidios/resource/constantes.dart';

class ReporteBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> createReporte(Reporte reporte) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.registrarReporte(reporte, token);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
    } else {
      print("el código del error" +
          apiResponse.statusResponse.toString() +
          " El mensaje de error es: " +
          apiResponse.message);
    }
    return apiResponse;
  }
  Future<ApiResponse> listarReporte() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.listaReporte(token);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
      return apiResponse;
    } else {
      print("el código del error" +
          apiResponse.statusResponse.toString() +
          " El mensaje de error es: " +
          apiResponse.message);
      return apiResponse;
    }
  }

  Future<ApiResponse> deleteReporte(Reporte reporte) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.eliminarReporte(reporte, token);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
    } else {
      print("el código del error" +
          apiResponse.statusResponse.toString() +
          " El mensaje de error es: " +
          apiResponse.message);
    }
    return apiResponse;
  }
}
