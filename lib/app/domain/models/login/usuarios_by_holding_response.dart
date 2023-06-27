// To parse this JSON data, do
//
//     final usuariosByHoldingResponse = usuariosByHoldingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mi_app/app/domain/models/login/usuario_by_holding.dart';

UsuariosByHoldingResponse usuariosByHoldingResponseFromJson(String str) =>
    UsuariosByHoldingResponse.fromJson(json.decode(str));

String usuariosByHoldingResponseToJson(UsuariosByHoldingResponse data) =>
    json.encode(data.toJson());

class UsuariosByHoldingResponse {
  String status;
  String msg;
  List<dynamic> errors;
  List<UsuarioByHolding> data;

  UsuariosByHoldingResponse({
    required this.status,
    required this.msg,
    required this.errors,
    required this.data,
  });

  factory UsuariosByHoldingResponse.fromJson(Map<String, dynamic> json) =>
      UsuariosByHoldingResponse(
        status: json["status"],
        msg: json["msg"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        data: List<UsuarioByHolding>.from(
            json["data"].map((x) => UsuarioByHolding.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
