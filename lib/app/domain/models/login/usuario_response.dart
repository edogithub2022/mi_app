// To parse this JSON data, do
//
//     final agrotarjaResponse = agrotarjaResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mi_app/app/domain/models/models.dart';

class UsuarioResponse {
  UsuarioResponse({
    required this.status,
    required this.msg,
    required this.errors,
    this.data,
  });

  String status;
  String msg;
  List<String> errors;
  Data? data;

  factory UsuarioResponse.fromRawJson(String str) =>
      UsuarioResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsuarioResponse.fromJson(Map<String, dynamic> json) =>
      UsuarioResponse(
        status: json["status"],
        msg: json["msg"],
        errors: json["errors"] == null
            ? []
            : List<String>.from(json["errors"].map((x) => x)),
        data: json["data"] == null ? json["data"] : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "data": data == null ? '' : data?.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.usuario,
  });

  String token;
  Usuario usuario;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        usuario: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "usuario": usuario.toJson(),
      };
}
