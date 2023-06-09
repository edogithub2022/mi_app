import 'dart:convert';

import 'package:mi_app/app/domain/models/erp/orden_compra/ocbyempresa.dart';

OrdenCompraByEmpresaResponse ordenCompraByEmpresaResponseFromJson(String str) =>
    OrdenCompraByEmpresaResponse.fromJson(json.decode(str));

String ordenCompraByEmpresaResponseToJson(OrdenCompraByEmpresaResponse data) =>
    json.encode(data.toJson());

class OrdenCompraByEmpresaResponse {
  String status;
  String msg;
  List<dynamic> errors;
  List<OcByEmpresa> data;

  OrdenCompraByEmpresaResponse({
    required this.status,
    required this.msg,
    required this.errors,
    required this.data,
  });

  factory OrdenCompraByEmpresaResponse.fromJson(Map<String, dynamic> json) =>
      OrdenCompraByEmpresaResponse(
        status: json["status"],
        msg: json["msg"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        data: List<OcByEmpresa>.from(
            json["data"].map((x) => OcByEmpresa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
