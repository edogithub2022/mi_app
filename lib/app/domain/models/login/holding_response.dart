// To parse this JSON holding, do
//
//     final holdingResponse = holdingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mi_app/app/domain/models/login/holding.dart';

HoldingResponse holdingResponseFromJson(String str) =>
    HoldingResponse.fromJson(json.decode(str));

String holdingResponseToJson(HoldingResponse holding) =>
    json.encode(holding.toJson());

class HoldingResponse {
  String status;
  String msg;
  List<dynamic> errors;
  Holding holding;

  HoldingResponse({
    required this.status,
    required this.msg,
    required this.errors,
    required this.holding,
  });

  factory HoldingResponse.fromJson(Map<String, dynamic> json) =>
      HoldingResponse(
        status: json["status"],
        msg: json["msg"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        holding: Holding.fromJson(json["holding"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "holding": holding.toJson(),
      };
}
