import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/consulta.dart';
import 'package:subsidios/Model/subsidio.dart';
import 'package:subsidios/Repository/repository.dart';
import 'package:subsidios/resource/constantes.dart';

class SubsidioBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> createSubsidio(Subsidio subsidio) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.registrarSubsidio(subsidio, token);
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
  Future<ApiResponse> listarSubsidio() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.listaSubsidio(token);
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

  Future<ApiResponse> deleteSubsidio(Subsidio subsidio) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.eliminarSubsidio(subsidio, token);
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

  Future<ApiResponse> buscaSubsidio(Subsidio subsidio) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.buscarSubsidio(subsidio, token);
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

  Future<ApiResponse> numeroConsultas(Consulta consulta) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.numeroDeConsultas(consulta, token);
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
