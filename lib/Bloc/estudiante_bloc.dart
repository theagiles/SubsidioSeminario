import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/estudiante.dart';
import 'package:subsidios/Repository/repository.dart';
import 'package:subsidios/resource/constantes.dart';

class EstudianteBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> createEstudiante(Estudiante estudiante) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.registrarEstudiante(estudiante, token);
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
  Future<ApiResponse> listarEstudiante() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.listaEstudiante(token);
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
  Future<ApiResponse> findEstudiante(Estudiante estudiante) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.buscarEstudiante(estudiante, token);
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
