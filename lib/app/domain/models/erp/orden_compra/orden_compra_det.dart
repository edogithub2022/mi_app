import 'package:mi_app/app/domain/models/erp/orden_compra/articulo.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/articulo_otro.dart';

class OrdenCompraDet {
  OrdenCompraDet({
    required this.codigoTipoCompra,
    required this.codArticulo,
    required this.nomArticulo,
    required this.cantidad,
    required this.precioUnitario,
    required this.codimpuesto,
    required this.valorImpuesto,
    required this.totalNeto,
    required this.totalBruto,
    this.articulo,
    this.articuloOtro,
  });

  int codigoTipoCompra;
  String codArticulo;
  String nomArticulo;
  int cantidad;
  double precioUnitario;
  int codimpuesto;
  double valorImpuesto;
  double totalNeto;
  double totalBruto;
  Articulo? articulo;
  ArticuloOtro? articuloOtro;

  factory OrdenCompraDet.fromJson(Map<String, dynamic> json) => OrdenCompraDet(
        codigoTipoCompra: json["CODIGO_TIPO_COMPRA"],
        codArticulo: json["COD_ARTICULO"],
        nomArticulo: json["NOM_ARTICULO"],
        cantidad: json["CANTIDAD"],
        precioUnitario: json["PRECIO_UNITARIO"]?.toDouble(),
        codimpuesto: json["CODIMPUESTO"],
        valorImpuesto: json["VALOR_IMPUESTO"]?.toDouble(),
        totalNeto: json["TOTAL_NETO"]?.toDouble(),
        totalBruto: json["TOTAL_BRUTO"]?.toDouble(),
        articulo: json["Articulo"] == null
            ? json["Articulo"]
            : Articulo.fromJson(json["Articulo"]),
        articuloOtro: json["ArticuloOtro"] == null
            ? json["ArticuloOtro"]
            : ArticuloOtro.fromJson(json["ArticuloOtro"]),
      );

  Map<String, dynamic> toJson() => {
        "CODIGO_TIPO_COMPRA": codigoTipoCompra,
        "COD_ARTICULO": codArticulo,
        "NOM_ARTICULO": nomArticulo,
        "CANTIDAD": cantidad,
        "PRECIO_UNITARIO": precioUnitario,
        "CODIMPUESTO": codimpuesto,
        "VALOR_IMPUESTO": valorImpuesto,
        "TOTAL_NETO": totalNeto,
        "TOTAL_BRUTO": totalBruto,
        "Articulo": articulo?.toJson(),
        "ArticuloOtro": articuloOtro?.toJson(),
      };
}
