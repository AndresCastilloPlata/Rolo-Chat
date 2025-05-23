// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:rolo_chat/models/usuario.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final bool ok;
  final Usuario usuario;
  final String token;

  LoginResponse({required this.ok, required this.usuario, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    ok: json["ok"],
    usuario: Usuario.fromJson(json["usuario"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "usuario": usuario.toJson(),
    "token": token,
  };
}
