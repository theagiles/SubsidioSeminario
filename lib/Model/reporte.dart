class Reporte {
  int idReporte;
  String fecha;
  String descripcion;
  int subsidio;

  Reporte({
    this.idReporte,
    this.fecha,
    this.descripcion,
    this.subsidio
  });

  factory Reporte.fromJson(Map<String, dynamic> parsedJson) {
    return Reporte(
      idReporte: parsedJson['id'],
      fecha: parsedJson['fecha'],
      descripcion: parsedJson['descripcion'],
      subsidio: parsedJson['subsidio']
    );
  }

  Map<String, dynamic> toJson() => {
        'id': idReporte,
        'fecha': fecha,
        'descripcion': descripcion,
        'subsidio': subsidio
      };
}
