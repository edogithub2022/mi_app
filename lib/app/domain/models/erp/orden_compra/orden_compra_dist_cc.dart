class OrdenCompraDistCcs {
  OrdenCompraDistCcs({
    required this.nroOC,
    required this.codArticulo,
    required this.codCentroCosto,
    required this.ctaContable,
    required this.monto,
  });

  int nroOC;
  String codArticulo;
  int codCentroCosto;
  int ctaContable;
  double monto;

  factory OrdenCompraDistCcs.fromJson(Map<String, dynamic> json) =>
      OrdenCompraDistCcs(
        nroOC: json["NROOC"],
        codArticulo: json["COD_ARTICULO"],
        codCentroCosto: json["COD_CENTROCOSTO"],
        ctaContable: json["CTACONTABLE"],
        monto: json["MONTO"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "NROOC": nroOC,
        "COD_ARTICULO": codArticulo,
        "COD_CENTROCOSTO": codCentroCosto,
        "CTACONTABLE": ctaContable,
        "MONTO": monto,
      };
}
