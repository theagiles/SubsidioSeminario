import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:subsidios/Model/api_response.dart';
import 'package:subsidios/Model/session.dart';

class SessionStorage {

  static final _storage = FlutterSecureStorage();
  final Session session = Session();
  final ApiResponse apiResponse = ApiResponse();

  Future<Map<String, String>> getAllValues() async {
    return await _storage.readAll();
  }

  Future<String> getValueforKey(String key) async {
    return await _storage.read(key: key);
  }

  Future deleteValue(String key) async {
    await _storage.delete(key: key);
  }

  Future deleteAllValues() async {
    await _storage.deleteAll();
  }

  Future writeValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future saveSessionStorage(Session session) async {
    await _storage.write(key: 'accessToken', value: session.token);
    await _storage.write(key: 'rol', value: session.rol);

  }
  Future<String> getToken() async {
    final String token = await _storage.read(key:'accessToken');
    print(token);
    return token;
  }
  Future<String> getRol() async {
    final String rol = await _storage.read(key:'rol');
    print("Session " + rol);
    return rol;
  }
}