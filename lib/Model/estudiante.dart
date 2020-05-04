
class Estudiante {
  int idEstudiante;
  String nombre;
  String apellido;
  String identificacion;
  int grado;
  String barrio;
  int estrato;
  String email;
  String password;

  
  Estudiante({
      this.idEstudiante,
      this.nombre,
      this.apellido,
      this.identificacion,
      this.grado,
      this.barrio,
      this.estrato,
      this.email,
      this.password
      });

  factory Estudiante.fromJson(Map<String, dynamic> parsedJson) {
    return Estudiante(
      idEstudiante: parsedJson['id'],
      nombre: parsedJson['nombre'],
      apellido: parsedJson['apellido'],
      identificacion: parsedJson['documento'],
      grado: parsedJson['grado'],
      barrio: parsedJson['barrio'],
      estrato: parsedJson['estrato'],
      email: parsedJson['correo'],
      password: parsedJson['password']
    );
  }

  Map<String, dynamic> toJson() => {
        'id': idEstudiante,
        'nombre': nombre,
        'apellido': apellido,
        'documento': identificacion,
        'grado': grado,
        'barrio': barrio,
        'estrato': estrato,
        'correo': email,
        'password':password
      };
}
