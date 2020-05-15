class Consulta {
  String fechaInicial;
  String fechaFinal;

  Consulta({this.fechaInicial, this.fechaFinal});

  factory Consulta.fromJson(Map<String, dynamic> json) {
    return Consulta(
        fechaInicial: json['dateInit'], fechaFinal: json['dateFinal']);
  }

  Map<String, dynamic> toJson() =>
      {'dateInit': fechaInicial, 'dateFinal': fechaFinal};

}
