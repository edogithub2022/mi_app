class Articulo {
  Articulo({
    required this.codImputable,
    required this.nombre,
  });

  String codImputable;
  String nombre;

  factory Articulo.fromJson(Map<String, dynamic> json) => Articulo(
        codImputable: json["COD_IMPUTABLE"],
        nombre: json["NOMBRE"],
      );

  Map<String, dynamic> toJson() => {
        "COD_IMPUTABLE": codImputable,
        "NOMBRE": nombre,
      };
}
