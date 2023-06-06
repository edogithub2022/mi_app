class Ccosto {
  Ccosto({
    required this.codCcosto,
    required this.descripcion,
  });

  int codCcosto;
  String descripcion;

  factory Ccosto.fromJson(Map<String, dynamic> json) => Ccosto(
        codCcosto: json["COD_CENTROCOSTO"],
        descripcion: json["DESCRIPCION"],
      );

  Map<String, dynamic> toJson() => {
        "COD_IMPUTABLE": codCcosto,
        "DESCRIPCION": descripcion,
      };
}
