
class Subsidio {
  int idSubsidio;
  String fecha;
  int numero;
  int valor;
  String estudiante;

  Subsidio({
    this.idSubsidio,
    this.fecha,
    this.numero,
    this.valor,
    this.estudiante

  });

  factory Subsidio.fromJson(Map<String, dynamic> parsedJson) {
    return Subsidio(
      idSubsidio: parsedJson['id'],
      fecha: parsedJson['fecha'],
      numero: parsedJson['numero'],
      valor: parsedJson['valor'],
      estudiante: parsedJson['estudiante'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': idSubsidio,
        'fecha': fecha,
        'numero': numero,
        'valor': valor,
        'estudiante': estudiante
      };
}
