class ElementoCosto {
  ElementoCosto({
    required this.codElementoCosto,
    required this.descripcion,
  });

  String codElementoCosto;
  String descripcion;

  factory ElementoCosto.fromJson(Map<String, dynamic> json) => ElementoCosto(
        codElementoCosto: json["COD_ELEMCOSTO"],
        descripcion: json["DESCRIPCION"],
      );

  Map<String, dynamic> toJson() => {
        "COD_ELEMCOSTO": codElementoCosto,
        "DESCRIPCION": descripcion,
      };
}
