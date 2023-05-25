// To parse this JSON data, do
//
//     final ordenCompraReturningResponse = ordenCompraReturningResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_cab_returning.dart';

OrdenCompraReturningResponse ordenCompraReturningResponseFromJson(String str) =>
    OrdenCompraReturningResponse.fromJson(json.decode(str));

String ordenCompraReturningResponseToJson(OrdenCompraReturningResponse data) =>
    json.encode(data.toJson());

class OrdenCompraReturningResponse {
  OrdenCompraReturningResponse({
    required this.status,
    required this.msg,
    required this.errors,
    required this.data,
  });

  String status;
  String msg;
  List<dynamic> errors;
  List<OrdenCompraCabReturning> data;

  factory OrdenCompraReturningResponse.fromJson(Map<String, dynamic> json) =>
      OrdenCompraReturningResponse(
        status: json["status"],
        msg: json["msg"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        data: List<OrdenCompraCabReturning>.from(
            json["data"].map((x) => OrdenCompraCabReturning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
