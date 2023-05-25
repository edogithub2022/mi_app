// To parse this JSON data, do
//
//     final usuariosResponse = usuariosResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mi_app/app/domain/models/models.dart';

class UsuariosResponse {
  UsuariosResponse({
    required this.status,
    required this.msg,
    required this.errors,
    this.data,
  });

  String status;
  String msg;
  List<String> errors;
  List<Usuario>? data;

  factory UsuariosResponse.fromRawJson(String str) =>
      UsuariosResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsuariosResponse.fromJson(Map<String, dynamic> json) =>
      UsuariosResponse(
        status: json["status"],
        msg: json["msg"],
        errors: List<String>.from(json["errors"].map((x) => x)),
        data: List<Usuario>.from(json["data"].map((x) => Usuario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
