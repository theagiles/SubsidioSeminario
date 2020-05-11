class Session {
  String token;
  String rol;
  String mensaje;

  Session({this.token, this.rol, this.mensaje});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(token: json['token'], rol: json['rol'], mensaje: json['mensaje']);
  }

  Map<String, dynamic> toJson() => {'token': token, 'rol': rol, 'mensaje': mensaje};

  Map<String, dynamic> refreshTokentoJson() => {'token': token };
}
