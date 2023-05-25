class ArticuloOtro {
  ArticuloOtro({
    required this.tipoCompra,
    required this.codImputable,
    required this.nombre,
  });

  int tipoCompra;
  String codImputable;
  String nombre;

  factory ArticuloOtro.fromJson(Map<String, dynamic> json) => ArticuloOtro(
        tipoCompra: json["TIPO_COMPRA"],
        codImputable: json["COD_IMPUTABLE"],
        nombre: json["NOMBRE"],
      );

  Map<String, dynamic> toJson() => {
        "TIPO_COMPRA": tipoCompra,
        "COD_IMPUTABLE": codImputable,
        "NOMBRE": nombre,
      };
}
