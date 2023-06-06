import 'package:mi_app/app/domain/models/erp/orden_compra/ccosto.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/elemento_costo.dart';

class OrdenCompraDistCcs {
  OrdenCompraDistCcs({
    required this.nroOC,
    required this.codArticulo,
    required this.codCentroCosto,
    required this.ctaContable,
    required this.monto,
    required this.ccosto,
    required this.elementoCosto,
  });

  int nroOC;
  String codArticulo;
  int codCentroCosto;
  int ctaContable;
  double monto;
  Ccosto? ccosto;
  ElementoCosto? elementoCosto;

  factory OrdenCompraDistCcs.fromJson(Map<String, dynamic> json) =>
      OrdenCompraDistCcs(
        nroOC: json["NROOC"],
        codArticulo: json["COD_ARTICULO"],
        codCentroCosto: json["COD_CENTROCOSTO"],
        ctaContable: json["CTACONTABLE"],
        monto: json["MONTO"]?.toDouble(),
        ccosto: json["Ccosto"] == null
            ? json["Ccosto"]
            : Ccosto.fromJson(json["Ccosto"]),
        elementoCosto: json["ElementoCosto"] == null
            ? json["ElementoCosto"]
            : ElementoCosto.fromJson(json["ElementoCosto"]),
      );

  Map<String, dynamic> toJson() => {
        "NROOC": nroOC,
        "COD_ARTICULO": codArticulo,
        "COD_CENTROCOSTO": codCentroCosto,
        "CTACONTABLE": ctaContable,
        "MONTO": monto,
        "Ccosto": ccosto?.toJson(),
        "ElementoCosto": elementoCosto?.toJson(),
      };
}
