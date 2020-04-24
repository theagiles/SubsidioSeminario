import 'package:subsidios/Model/estrato.dart';

class Estudiante {
  int idEstudiante;
  String nombre;
  String apellido;
  String identificacion;
  String grado;
  String barrio;
  String usuario;
  String password;
  Estrato estrato;

  
  Estudiante({
      this.idEstudiante,
      this.nombre,
      this.apellido,
      this.identificacion,
      this.grado,
      this.barrio,
      this.usuario,
      this.password,
      this.estrato
      });

  factory Estudiante.fromJson(Map<String, dynamic> parsedJson) {
    return Estudiante(
      idEstudiante: parsedJson['id'],
      nombre: parsedJson['nombre'],
      apellido: parsedJson['apellido'],
      identificacion: parsedJson['identificacion'],
      grado: parsedJson['grado'],
      barrio: parsedJson['barrio'],
      usuario: parsedJson['usuario'],
      password: parsedJson['password'],
      estrato: Estrato.fromJson(parsedJson['estrato'])
    );
  }

  Map<String, dynamic> toJson() => {
        'id': idEstudiante,
        'nombre': nombre,
        'apellido': apellido,
        'identificacion': identificacion,
        'grado': grado,
        'barrio': barrio,
        'usuario': usuario,
        'password': password,
        'estrato': estrato.toJson(),
      };
}
