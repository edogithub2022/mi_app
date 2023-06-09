import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_det.dart';
import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_dist_cc.dart';

class OrdenCompraCab {
  OrdenCompraCab({
    required this.codempresa,
    required this.estadoRecepcion,
    required this.correlativo,
    required this.numeroSolicitud,
    required this.proveNombre,
    required this.proveRutn,
    required this.proveRutd,
    required this.observaciones,
    this.motivoRechazo,
    required this.soliCodsolicitador,
    required this.soliCodcomprador,
    required this.fechaEntrega,
    required this.totalEspecifico,
    required this.codmoneda,
    required this.proveEmail,
    required this.fechaCreacion,
    required this.ordenCompraDets,
    required this.ordenCompraDistCcs,
  });

  int codempresa;
  String estadoRecepcion;
  int correlativo;
  int numeroSolicitud;
  String proveNombre;
  int proveRutn;
  String proveRutd;
  String observaciones;
  String? motivoRechazo;
  String soliCodsolicitador;
  String soliCodcomprador;
  DateTime fechaEntrega;
  int totalEspecifico;
  int codmoneda;
  String proveEmail;
  DateTime fechaCreacion;
  List<OrdenCompraDet> ordenCompraDets;
  List<OrdenCompraDistCcs> ordenCompraDistCcs;

  factory OrdenCompraCab.fromJson(Map<String, dynamic> json) => OrdenCompraCab(
        codempresa: json["CODEMPRESA"],
        estadoRecepcion: json["ESTADO_RECEPCION"],
        correlativo: json["CORRELATIVO"],
        numeroSolicitud: json["NUMERO_SOLICITUD"],
        proveNombre: json["PROVE_NOMBRE"],
        proveRutn: json["PROVE_RUTN"],
        proveRutd: json["PROVE_RUTD"],
        observaciones: json["OBSERVACIONES"],
        motivoRechazo: json["MOTIVO_RECHAZO"],
        soliCodsolicitador: json["SOLI_CODSOLICITADOR"],
        soliCodcomprador: json["SOLI_CODCOMPRADOR"],
        fechaEntrega: DateTime.parse(json["FECHA_ENTREGA"]),
        totalEspecifico: json["totalEspecifico"],
        codmoneda: json["CODMONEDA"],
        proveEmail: json["PROVE_EMAIL"],
        fechaCreacion: DateTime.parse(json["FECHA_CREACION"]),
        ordenCompraDets: List<OrdenCompraDet>.from(
            json["OrdenCompraDets"].map((x) => OrdenCompraDet.fromJson(x))),
        ordenCompraDistCcs: List<OrdenCompraDistCcs>.from(
            json["OrdenCompraDistCcs"]
                .map((x) => OrdenCompraDistCcs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CODEMPRESA": codempresa,
        "ESTADO_RECEPCION": estadoRecepcion,
        "CORRELATIVO": correlativo,
        "NUMERO_SOLICITUD": numeroSolicitud,
        "PROVE_NOMBRE": proveNombre,
        "PROVE_RUTN": proveRutn,
        "PROVE_RUTD": proveRutd,
        "OBSERVACIONES": observaciones,
        "MOTIVO_RECHAZO": motivoRechazo,
        "SOLI_CODSOLICITADOR": soliCodsolicitador,
        "SOLI_CODCOMPRADOR": soliCodcomprador,
        "FECHA_ENTREGA": fechaEntrega.toIso8601String(),
        "totalEspecifico": totalEspecifico,
        "CODMONEDA": codmoneda,
        "PROVE_EMAIL": proveEmail,
        "FECHA_CREACION": fechaCreacion.toIso8601String(),
        "OrdenCompraDets":
            List<dynamic>.from(ordenCompraDets.map((x) => x.toJson())),
        "OrdenCompraDistCcs":
            List<dynamic>.from(ordenCompraDistCcs.map((x) => x.toJson())),
      };
}
