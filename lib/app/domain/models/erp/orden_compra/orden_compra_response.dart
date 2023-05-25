// To parse this JSON data, do
//
//     final ordenCompraResponse = ordenCompraResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_cab.dart';

OrdenCompraResponse ordenCompraResponseFromJson(String str) =>
    OrdenCompraResponse.fromJson(json.decode(str));

String ordenCompraResponseToJson(OrdenCompraResponse data) =>
    json.encode(data.toJson());

class OrdenCompraResponse {
  OrdenCompraResponse({
    required this.status,
    required this.msg,
    required this.errors,
    required this.data,
  });

  String status;
  String msg;
  List<dynamic> errors;
  List<OrdenCompraCab> data;

  factory OrdenCompraResponse.fromJson(Map<String, dynamic> json) =>
      OrdenCompraResponse(
        status: json["status"],
        msg: json["msg"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        data: List<OrdenCompraCab>.from(
            json["data"].map((x) => OrdenCompraCab.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
