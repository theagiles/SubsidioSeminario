class RestConsulta {
  String fecha;
  int cantidad;

  RestConsulta({this.fecha, this.cantidad});

  factory RestConsulta.fromJson(Map<String, dynamic> json) {
    return RestConsulta(
        fecha: json['fecha'], cantidad: json['cantidad']);
  }

  Map<String, dynamic> toJson() =>
      {'fecha': fecha, 'cantidad': cantidad};

}
