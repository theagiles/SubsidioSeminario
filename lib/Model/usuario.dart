class Usuario {
  int idUsuario;
  String correo;
  String password;

  Usuario({
    this.idUsuario,
    this.correo,
    this.password,
  });

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
      idUsuario: parsedJson['id'],
      correo: parsedJson['correo'],
      password: parsedJson['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': idUsuario,
        'correo': correo,
        'password': password,
      };
}
