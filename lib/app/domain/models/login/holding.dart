class Holding {
  String uuid;
  String holding;
  bool estado;
  DateTime createdAt;
  DateTime updatedAt;

  Holding({
    required this.uuid,
    required this.holding,
    required this.estado,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Holding.fromJson(Map<String, dynamic> json) => Holding(
        uuid: json["uuid"],
        holding: json["holding"],
        estado: json["estado"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "holding": holding,
        "estado": estado,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
