class Session {
  String token;

  Session({this.token});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(token: json['body']);
  }

  Map<String, dynamic> toJson() => {'body': token};

  Map<String, dynamic> refreshTokentoJson() => {'body': token};
}
