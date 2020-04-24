class Estrato {
  int idEstrato;
  String estrato;

  Estrato({
    this.idEstrato,
    this.estrato,
  });

  factory Estrato.fromJson(Map<String, dynamic> parsedJson) {
    return Estrato(
      idEstrato: parsedJson['id'],
      estrato: parsedJson['estrato'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': idEstrato,
        'estrato': estrato,
      };
}
