// To parse this JSON data, do
//
//     final holdingsResponse = holdingsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mi_app/app/domain/models/login/holding.dart';

HoldingsResponse holdingsResponseFromJson(String str) =>
    HoldingsResponse.fromJson(json.decode(str));

String holdingsResponseToJson(HoldingsResponse data) =>
    json.encode(data.toJson());

class HoldingsResponse {
  String status;
  String msg;
  List<dynamic> errors;
  List<Holding> data;

  HoldingsResponse({
    required this.status,
    required this.msg,
    required this.errors,
    required this.data,
  });

  factory HoldingsResponse.fromJson(Map<String, dynamic> json) =>
      HoldingsResponse(
        status: json["status"],
        msg: json["msg"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        data: List<Holding>.from(json["data"].map((x) => Holding.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
