class OrdenCompraCabReturning {
  OrdenCompraCabReturning({
    required this.codHolding,
    required this.codempresa,
    required this.correlativo,
    required this.impuestoEspecifico,
    required this.proveNombre,
    required this.jefeareaAprobador,
    required this.estadoRecepcion,
    required this.numeroSolicitud,
    required this.proveRutn,
    required this.proveRutd,
    required this.observaciones,
    required this.motivoRechazo,
    required this.soliCodsolicitador,
    required this.soliCodcomprador,
    required this.fechaEntrega,
    required this.codmoneda,
  });

  int codHolding;
  int codempresa;
  int correlativo;
  int impuestoEspecifico;
  String proveNombre;
  String jefeareaAprobador;
  String estadoRecepcion;
  int numeroSolicitud;
  int proveRutn;
  String proveRutd;
  String observaciones;
  String motivoRechazo;
  String soliCodsolicitador;
  String soliCodcomprador;
  DateTime fechaEntrega;
  int codmoneda;

  factory OrdenCompraCabReturning.fromJson(Map<String, dynamic> json) =>
      OrdenCompraCabReturning(
        codHolding: json["COD_HOLDING"],
        codempresa: json["CODEMPRESA"],
        correlativo: json["CORRELATIVO"],
        impuestoEspecifico: json["IMPUESTO_ESPECIFICO"],
        proveNombre: json["PROVE_NOMBRE"],
        jefeareaAprobador: json["JEFEAREA_APROBADOR"],
        estadoRecepcion: json["ESTADO_RECEPCION"],
        numeroSolicitud: json["NUMERO_SOLICITUD"],
        proveRutn: json["PROVE_RUTN"],
        proveRutd: json["PROVE_RUTD"],
        observaciones: json["OBSERVACIONES"],
        motivoRechazo: json["MOTIVO_RECHAZO"],
        soliCodsolicitador: json["SOLI_CODSOLICITADOR"],
        soliCodcomprador: json["SOLI_CODCOMPRADOR"],
        fechaEntrega: DateTime.parse(json["FECHA_ENTREGA"]),
        codmoneda: json["CODMONEDA"],
      );

  Map<String, dynamic> toJson() => {
        "COD_HOLDING": codHolding,
        "CODEMPRESA": codempresa,
        "CORRELATIVO": correlativo,
        "IMPUESTO_ESPECIFICO": impuestoEspecifico,
        "PROVE_NOMBRE": proveNombre,
        "JEFEAREA_APROBADOR": jefeareaAprobador,
        "ESTADO_RECEPCION": estadoRecepcion,
        "NUMERO_SOLICITUD": numeroSolicitud,
        "PROVE_RUTN": proveRutn,
        "PROVE_RUTD": proveRutd,
        "OBSERVACIONES": observaciones,
        "MOTIVO_RECHAZO": motivoRechazo,
        "SOLI_CODSOLICITADOR": soliCodsolicitador,
        "SOLI_CODCOMPRADOR": soliCodcomprador,
        "FECHA_ENTREGA": fechaEntrega.toIso8601String(),
        "CODMONEDA": codmoneda,
      };
}
