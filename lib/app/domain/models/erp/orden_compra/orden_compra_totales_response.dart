// To parse this JSON data, do
//
//     final ordenCompraTotalesResponse = ordenCompraTotalesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mi_app/app/domain/models/models.dart';

OrdenCompraTotalesResponse ordenCompraTotalesResponseFromJson(String str) =>
    OrdenCompraTotalesResponse.fromJson(json.decode(str));

String ordenCompraTotalesResponseToJson(OrdenCompraTotalesResponse data) =>
    json.encode(data.toJson());

class OrdenCompraTotalesResponse {
  OrdenCompraTotalesResponse({
    required this.status,
    required this.msg,
    this.errors,
    required this.data,
  });

  String status;
  String msg;
  List<String>? errors = [];
  List<OrdenCompraTotales> data;

  factory OrdenCompraTotalesResponse.fromJson(Map<String, dynamic> json) =>
      OrdenCompraTotalesResponse(
        status: json["status"],
        msg: json["msg"],
        errors: List<String>.from(json["errors"].map((x) => x)),
        data: List<OrdenCompraTotales>.from(
            json["data"].map((x) => OrdenCompraTotales.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors":
            errors == null ? [] : List<String>.from(errors!.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
