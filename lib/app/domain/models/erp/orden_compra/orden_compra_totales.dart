class OrdenCompraTotales {
  OrdenCompraTotales({
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
    this.codmoneda,
    this.proveEmail,
    this.fechaCreacion,
    required this.totalNeto,
    required this.totalIva,
    required this.totalExento,
    required this.totalEspecifico,
    required this.totalBruto,
    this.razonSocial,
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
  int? codmoneda;
  String? proveEmail;
  DateTime? fechaCreacion;
  double totalNeto;
  double totalIva;
  double totalExento;
  double totalEspecifico;
  double totalBruto;
  String? razonSocial;

  factory OrdenCompraTotales.fromJson(Map<String, dynamic> json) =>
      OrdenCompraTotales(
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
        codmoneda: json["CODMONEDA"],
        proveEmail: json["PROVE_EMAIL"],
        fechaCreacion: DateTime.parse(json["FECHA_CREACION"]),
        totalNeto: json["totalNeto"]?.toDouble(),
        totalIva: json["totalIva"]?.toDouble(),
        totalExento: json["totalExento"]?.toDouble(),
        totalEspecifico: json["totalEspecifico"]?.toDouble(),
        totalBruto: json["total_bruto"]?.toDouble(),
        razonSocial: json["razonSocial"],
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
        "codmoneda": codmoneda ?? 1,
        "proveEmail": proveEmail ?? "",
        "fechaCreacion": fechaCreacion?.toIso8601String() ?? "",
        "totalNeto": totalNeto,
        "totalIva": totalIva,
        "totalExento": totalExento,
        "totalEspecifico": totalEspecifico,
        "total_bruto": totalBruto,
        "razonSocial": razonSocial ?? '',
      };

  OrdenCompraTotales copy() => OrdenCompraTotales(
        codempresa: codempresa,
        estadoRecepcion: estadoRecepcion,
        correlativo: correlativo,
        numeroSolicitud: numeroSolicitud,
        proveNombre: proveNombre,
        proveRutn: proveRutn,
        proveRutd: proveRutd,
        observaciones: observaciones,
        motivoRechazo: motivoRechazo,
        soliCodsolicitador: soliCodsolicitador,
        soliCodcomprador: soliCodcomprador,
        fechaEntrega: fechaEntrega,
        codmoneda: codmoneda,
        proveEmail: proveEmail,
        fechaCreacion: fechaCreacion,
        totalNeto: totalNeto,
        totalIva: totalIva,
        totalExento: totalExento,
        totalEspecifico: totalEspecifico,
        totalBruto: totalBruto,
        razonSocial: razonSocial,
      );
}
