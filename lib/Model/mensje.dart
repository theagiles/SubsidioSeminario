class Respuesta {
  int codigo;
  String mensaje;
  String body;

  Respuesta({this.codigo, this.mensaje, this.body});

  factory Respuesta.fromJson(Map<String, dynamic> json) {
    return Respuesta(
        codigo: json['codigoRetorno'], mensaje: json['mensaje'], body: json['body']);
  }

  Map<String, dynamic> toJson() =>
      {'codigoRetorno': codigo, 'mensaje': mensaje, 'body': body};

}