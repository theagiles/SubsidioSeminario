class Consulta {
  String fechaInicial;
  String fechaFinal;
  String fecha;
  int cantidad;

  Consulta({this.fechaInicial, this.fechaFinal, this.fecha, this.cantidad});



  factory Consulta.fromJson(Map<String, dynamic> json) {
    return Consulta(
        fechaInicial: json['dateInit'], fechaFinal: json['dateFinal'], fecha: json['fecha'], cantidad: json['cantidad']);
  }

  Map<String, dynamic> toJson() =>
      {'dateInit': fechaInicial, 'dateFinal': fechaFinal, 'fecha': fecha, 'cantidad': cantidad};

}
